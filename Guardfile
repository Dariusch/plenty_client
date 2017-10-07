notification :off
guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(plenty_client/)?(.+)\.rb$}) { |m| "spec/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
