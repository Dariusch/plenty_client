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
  end
end
