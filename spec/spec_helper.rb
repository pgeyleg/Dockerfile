require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'dockerfile'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |c|
    c.syntax = :expect
  end

  config.example_status_persistence_file_path = 'tmp/examples.txt'
end
