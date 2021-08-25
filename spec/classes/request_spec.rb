require 'spec_helper'

RSpec.describe PlentyClient::Request::ClassMethods do
  let(:request_client) { Class.new { include PlentyClient::Request } }

  before(:each) do
    PlentyClient::Config.site_url = 'https://www.example.com'
    PlentyClient::Config.api_user = 'example'
    PlentyClient::Config.api_password = 'secret'
    PlentyClient::Config.access_token = 'ACCESS_TOKEN'
  end

  def stub_api_tokens(access_token: 'foobar', expiry_date: Time.now + 86400, refresh_token: 'foobar')
    PlentyClient::Config.access_token = access_token
    PlentyClient::Config.refresh_token = refresh_token
    PlentyClient::Config.expiry_date = expiry_date
  end

  def response_headers(mimetype = 'application/json')
    {
      'Content-Type' => "#{mimetype}; charset=UTF-8"
    }
  end

  describe 'requests' do
    describe '#request' do
      before(:each) do
        stub_api_tokens
      end

      context 'with valid arguments' do
        it 'makes a HTTP call' do
          stub_request(:post, 'https://www.example.com/rest/index.html').to_return(
            status: 200, body: '{}', headers: response_headers
          )

          request_client.request(:post, '/index.html')
          expect(WebMock).to have_requested(:post, /example/)
        end
      end

      context 'without http_method' do
        it 'raises an ArgumentError' do
          expect { request_client.request(nil, '/index.html') }.to raise_exception(ArgumentError)
        end
      end

      context 'on conection timeout' do
        it 'redo' do
          stub_request(:post, 'https://www.example.com/rest/index.php').to_timeout
          stub_request(:post, 'https://www.example.com/rest/index.php').to_return(
            status: 200, body: '{}', headers: response_headers
          )

          response = request_client.request(:post, '/index.php')

          expect(response).to eq({})
        end
      end

      context 'without path' do
        it 'raises an ArgumentError' do
          expect { request_client.request(:post) }.to raise_exception(ArgumentError)
        end
      end

      context 'on 3xx response' do
        it 'raises a RedirectionError' do
          stub_request(:post, 'https://www.example.com/rest/index.php').to_return(status: 300)

          expect { request_client.request(:post, '/index.php') }.to raise_exception(PlentyClient::RedirectionError)
        end
      end

      context 'on 4xx Error' do
        it 'raises a ClientError' do
          stub_request(:post, 'https://www.example.com/rest/index.php').to_return(status: 400)

          expect { request_client.request(:post, '/index.php') }.to raise_exception(PlentyClient::ClientError)
        end
      end

      context 'on 5xx Error' do
        it 'raises a ServerError' do
          stub_request(:post, 'https://www.example.com/rest/index.php').to_return(status: 500)

          expect { request_client.request(:post, '/index.php') }.to raise_exception(PlentyClient::ServerError)
        end
      end
    end

    describe 'wrappers for #request' do
      describe '#post' do
        it 'calls #request with :post and rest of params' do
          expect(request_client).to receive(:request).with(:post, '/index.php', 'param1' => 'value1')
          request_client.post('/index.php', 'param1' => 'value1')
        end
      end

      describe '#put' do
        it 'calls #request with :put and rest of params' do
          expect(request_client).to receive(:request).with(:put, '/index.php', 'param1' => 'value1')
          request_client.put('/index.php', 'param1' => 'value1')
        end
      end

      describe '#patch' do
        it 'calls #request with :patch and rest of params' do
          expect(request_client).to receive(:request).with(:patch, '/index.php', 'param1' => 'value1')
          request_client.patch('/index.php', 'param1' => 'value1')
        end
      end

      describe '#delete' do
        it 'calls #request with :delete and rest of params' do
          expect(request_client).to receive(:request).with(:delete, '/index.php', 'param1' => 'value1')
          request_client.delete('/index.php', 'param1' => 'value1')
        end
      end

      describe '#get' do
        context 'when called without a block' do
          context 'when called without page param' do
            it 'calls #request with :get and rest of params, merged with page: 1' do
              expect(request_client).to receive(:request).with(:get, '/index.php', 'p1' => 'v1', 'page' => 1)
              request_client.get('/index.php', 'p1' => 'v1')
            end
          end

          context 'when called with page param' do
            it 'calls #request with :get and unchanged params' do
              expect(request_client)
                .to receive(:request)
                .with(:get, '/index.php', hash_including('p1' => 'v1', 'page' => 100))
              request_client.get('/index.php', 'p1' => 'v1', 'page' => 100)
            end
          end
        end

        context 'when called with a block' do
          before do
            stub_api_tokens
            stub_request(:get, /example/)
              .to_return do |r|
              query = CGI.parse(r.uri.query)
              page = query['page'][0].to_i
              {
                body: {
                  page: page,
                  totalsCount: 3,
                  isLastPage: (page == 3),
                  entries: %w[a b c]
                }.to_json,
                headers: response_headers
              }
            end
          end

          it 'calls #request with get until it gets last page' do
            request_client.get('/index.php', {}) do
              'Hello world'
            end
            expect(WebMock).to have_requested(:get, /example/).times(3)
          end

          it 'yields entries n times' do
            expect { |b| request_client.get('/index.php', {}, &b) }.to yield_control.exactly(3).times
          end
        end
      end
    end
  end

  describe 'wrong conent type' do
    before do
      stub_api_tokens
    end

    context 'when API responds with non empty text/html response' do
      it 'raises PlentyClient::ResponseError' do
        stub_request(:post, /index\.html/)
          .to_return(headers: response_headers('text/html'),
                     body: '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN"><html><head></head><body></body></html>')
        expect { request_client.request(:post, '/index.html') }
          .to raise_exception(PlentyClient::ResponseError)
      end
    end

      context 'when API responds with an empty text/html response' do
      it 'does not raises PlentyClient::ResponseError' do
        stub_request(:post, /index\.html/)
          .to_return(headers: response_headers('text/html'),
                     body: ' ')
          .to_return(headers: response_headers, body: {}.to_json)
        expect { request_client.request(:post, '/index.html') }
          .not_to raise_exception
      end
    end
  end

  describe 'throttle check' do
    context 'short period' do
      before do
        stub_api_tokens
      end

      it 'enough calls left' do
        stub_request(:post, /foobar/).to_return(
          body: {}.to_json,
          headers: {
            'X-Plenty-Global-Short-Period-Calls-Left' => 50,
            'X-Plenty-Global-Short-Period-Decay' => 5
          }.merge(response_headers)
        )
        _success_request = request_client.request(:post, '/foobar')
        expect(Object).not_to receive(:sleep)
        request_client.request(:post, '/foobar')
      end

      it 'limit reached' do
        seconds_left = 2
        stub_request(:post, /foobar/).to_return(
          body: {}.to_json,
          headers: {
            'X-Plenty-Global-Short-Period-Calls-Left' => 5,
            'X-Plenty-Global-Short-Period-Decay' => seconds_left
          }.merge(response_headers)
        )
        _success_request = request_client.request(:post, '/foobar')
        expect(Object).to receive(:sleep).with(seconds_left)
        _delayed_request = request_client.request(:post, '/foobar')
      end
    end
  end

  describe 'authentication' do
    context 'when no accessToken is present' do
      before do
        PlentyClient::Config.access_token = nil
        PlentyClient::Config.refresh_token = nil
        PlentyClient::Config.expiry_date = nil
        @login_request = stub_request(:post, /login/)
                         .to_return(body: {
                                      'tokenType' => 'Bearer',
                                      'expiresIn' => 86400,
                                      'accessToken' => 'foo_access_token',
                                      'refreshToken' => 'foo_refresh_token'
                                    }.to_json,
                                    headers: response_headers
                                   )
        @actual_request = stub_request(:post, /index\.html/)
                          .to_return(body: {}.to_json, headers: response_headers)
      end

      context 'when credentials are missing' do
        before do
          PlentyClient::Config.api_user = nil
          PlentyClient::Config.api_password = nil
        end

        it 'raises PlentyClient::Config::NoCredentials' do
          expect { request_client.request(:post, '/index.html') }
            .to raise_exception(PlentyClient::Config::NoCredentials)
        end

        it 'does not perform login request' do
          expect(@login_request).not_to have_been_made
        end

        it 'does not perform the actual request' do
          expect(@actual_request).not_to have_been_made
        end
      end

      context 'when all credentials are present' do
        before do
          PlentyClient::Config.api_user = 'foouser'
          PlentyClient::Config.api_password = 'foopass'
        end

        it 'performs a POST request with username and password' do
          request_client.request(:post, '/index.html')
          expect(@login_request).to have_been_made.once
        end

        context 'when credentials are correct' do
          before(:each) do
            request_client.request(:post, '/index.html')
          end

          it 'sets Config.access_token' do
            expect(PlentyClient::Config.access_token).to eq('foo_access_token')
          end

          it 'sets Config.refresh_token' do
            expect(PlentyClient::Config.refresh_token).to eq('foo_refresh_token')
          end

          it 'sets Config.expiry_date' do
            expect(PlentyClient::Config.expiry_date.to_i).to be_within(1).of((Time.now + 86400).to_i)
          end

          it 'performs the actual request' do
            expect(@actual_request).to have_been_made.once
          end
        end

        context 'when credentials are incorrect' do
          before do
            @login_request = stub_request(:post, /login/).to_return(body: {
              'error' => 'invalid_credentials',
              'message' => 'The user credentials were incorrect.',
              'tokenType' => nil,
              'expiresIn' => nil,
              'accessToken' => nil,
              'refreshToken' => nil
            }.to_json, headers: response_headers)
          end

          it 'raises PlentyClient::Config::InvalidCredentials' do
            expect { request_client.request(:post, '/index.html') }
              .to raise_exception(PlentyClient::Config::InvalidCredentials)
          end

          describe 'handling' do
            before(:each) do
              begin
                request_client.request(:post, '/index.html')
              rescue PlentyClient::Config::InvalidCredentials
              end
            end

            it 'does not perform the actual request' do
              expect(@actual_request).not_to have_been_made
            end

            it 'does not set Config.access_token' do
              expect(PlentyClient::Config.access_token).to be_nil
            end

            it 'does not set Config.refresh_token' do
              expect(PlentyClient::Config.refresh_token).to be_nil
            end

            it 'does not set Config.expiry_date' do
              expect(PlentyClient::Config.expiry_date).to be_nil
            end
          end
        end
      end
    end
  end

  describe 'renewing API tokens' do
    before do
      PlentyClient::Config.access_token = 'old_token'
      PlentyClient::Config.refresh_token = 'old_refresh_token'
      @login_request = stub_request(:post, /login/).to_return(body: {
        'tokenType' => 'Bearer',
        'expiresIn' => 86400,
        'accessToken' => 'new_token',
        'refreshToken' => 'new_refresh_token'
      }.to_json, headers: response_headers)
      @actual_request = stub_request(:post, /index\.html/).to_return(body: {
      }.to_json, headers: response_headers)
    end

    context 'when expiry_date is in the past' do
      it 'sends login request' do
        PlentyClient::Config.expiry_date = Time.now - 600
        request_client.request(:post, '/index.html')
        expect(@login_request).to have_been_made.once
      end
    end

    context 'when expiry_date is <60s from now' do
      it 'sends login request' do
        PlentyClient::Config.expiry_date = Time.now + 45
        request_client.request(:post, '/index.html')
        expect(@login_request).to have_been_made.once
      end
    end

    context 'when expiry_date is >60s from now' do
      it 'does not send login request' do
        PlentyClient::Config.expiry_date = Time.now + 600
        request_client.request(:post, '/index.html')
        expect(@login_request).not_to have_been_made
      end
    end
  end
end
