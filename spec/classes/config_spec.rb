require 'spec_helper'

RSpec.describe PlentyClient::Config do
  describe 'error handling' do
    describe '.validate' do
      let(:config) { PlentyClient::Config }

      before(:each) do
        config.site_url = 'https://www.example.com'
        config.api_user = 'foobar'
        config.api_password = 'foobar'
        config.log = true
        config.plenty_id = 108108
      end

      context 'when an attribute is missing' do
        context 'when site_url is nil' do
          it 'raises PlentyClient::Config::NoCredentials' do
            config.site_url = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoCredentials)
          end
        end

        context 'when api_user is nil' do
          it 'raises PlentyClient::Config::NoCredentials' do
            config.api_user = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoCredentials)
          end
        end

        context 'when api_password is nil' do
          it 'raises PlentyClient::Config::NoCredentials' do
            config.api_password = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoCredentials)
          end
        end

        xcontext 'when access_token is nil' do
          it 'raises PlentyClient::Config::NoToken' do
            config.access_token = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoToken)
          end
        end

        xcontext 'when refresh_token is nil' do
          it 'raises PlentyClient::Config::NoToken' do
            config.refresh_token = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoToken)
          end
        end

        context 'when plenty_id is nil' do
          it 'raises PlentyClient::Config::NoPlentyId' do
            config.plenty_id = nil
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoPlentyId)
          end
        end

        context "when plenty_id == ''" do
          it 'raises PlentyClient::Config::NoPlentyId' do
            config.plenty_id = ''
            expect { config.validate }.to raise_exception(PlentyClient::Config::NoPlentyId)
          end
        end
      end

      context 'when all attributes are present' do
        it 'does not raise exception' do
          expect { config.validate }.not_to raise_exception
        end
      end
    end
  end
end
