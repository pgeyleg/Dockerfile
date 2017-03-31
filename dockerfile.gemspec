$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'dockerfile/version'

Gem::Specification.new do |spec|
  spec.name        = 'dockerfile'
  spec.version     = Dockerfile::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.summary     = 'Dockerfile Templating'
  spec.description = 'Ruby library to generate Dockerfile dynamically'
  spec.authors     = ['Pema Geyleg']
  spec.email       = 'pema.geyleg@gmail.com'
  spec.files       = ['lib/dockerfile.rb']
  spec.homepage    = 'https://github.com/pgeyleg/dockerfile'
  spec.license     = 'MIT'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'

  spec.required_ruby_version = '>= 2.4.1'
end
