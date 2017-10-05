$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'plenty_client'

WebMock.disable_net_connect!
