lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plenty_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'plenty_client'
  spec.version       = PlentyClient::VERSION
  spec.authors       = ['Dariusch Ochlast']
  spec.email         = ['dariusch.ochlast@gmail.com']

  spec.summary       = 'This is Version 1 of the PlentyMarkets Rest Client for Ruby.'
  spec.description   = 'This Client is a wrapper arount the PlentyMarkets REST API providing simple classes to interact.'
  spec.homepage      = 'https://github.com/Dariusch/plenty_client'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'json', '~> 1.8', '>= 1.8.0'
  spec.add_dependency 'curb', '~> 0.9.3'
end
