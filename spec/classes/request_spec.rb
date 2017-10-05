require 'spec_helper'

RSpec.describe PlentyClient::Request::ClassMethods do
  let(:ic) { Class.new { include PlentyClient::Request } }

  before(:each) do
    PlentyClient::Config.site_url = 'https://www.example.com'
  end

  def stub_api_tokens(access_token: 'foobar', expiry_date: Time.now + 86400,
                      refresh_token: 'foobar')
    PlentyClient::Config.access_token = access_token
    PlentyClient::Config.refresh_token = refresh_token
    PlentyClient::Config.expiry_date = expiry_date
  end

  describe 'requests' do
    describe '#request' do
      before(:each) do
        stub_api_tokens
        stub_request(:any, /example/)
          .to_return(status: 200, body: '{}', headers: {})
      end

      context 'with valid arguments' do
        it 'makes a HTTP call' do
          ic.request(:post, '/index.html')
          expect(WebMock).to have_requested(:post, /example/)
        end
      end

      context 'without http_method' do
        it 'returns false' do
          response = ic.request(nil, '/index.html')
          expect(response).to be false
        end

        it 'does not make a HTTP call' do
          expect(WebMock).not_to have_requested(:any, /example/)
          ic.request(nil, '/index.html')
        end
      end

      context 'without path' do
        it 'returns false' do
          response = ic.request(:post, nil)
          expect(response).to be false
        end

        it 'does not make a HTTP call' do
          expect(WebMock).not_to have_requested(:any, /example/)
          ic.request(:post, nil)
        end
      end
    end
    
    describe 'wrappers for #request' do
      describe '#post' do
        it 'calls #request with :post and rest of params' do
          expect(ic).to receive(:request).with(:post, '/index.php', { 'param1' => 'value1' })
          ic.post('/index.php', { 'param1' => 'value1' })
        end
      end

      describe '#put' do
        it 'calls #request with :put and rest of params' do
          expect(ic).to receive(:request).with(:put, '/index.php', { 'param1' => 'value1' })
          ic.put('/index.php', { 'param1' => 'value1' })
        end
      end

      describe '#patch' do
        it 'calls #request with :patch and rest of params' do
          expect(ic).to receive(:request).with(:patch, '/index.php', { 'param1' => 'value1' })
          ic.patch('/index.php', { 'param1' => 'value1' })
        end
      end
      
      describe '#delete' do
        it 'calls #request with :delete and rest of params' do
          expect(ic).to receive(:request).with(:delete, '/index.php', { 'param1' => 'value1' })
          ic.delete('/index.php', { 'param1' => 'value1' })
        end
      end

      describe '#get' do
        context 'when called without a block' do
          context 'when called without page param' do
            it 'calls #request with :get and rest of params, merged with page: 1' do
              expect(ic).to receive(:request).with(:get, '/index.php', { 'p1' => 'v1', 'page' => 1 })
              ic.get('/index.php', { 'p1' => 'v1' })
            end
          end

          context 'when called with page param' do
            it 'calls #request with :get and unchanged params' do
              expect(ic).to receive(:request).with(:get, '/index.php', hash_including('p1' => 'v1', 'page' => 100))
              ic.get('/index.php', { 'p1' => 'v1', 'page' => 100 })
            end
          end
        end

        context 'when called with a block' do

        end
      end
    end
  end
end
