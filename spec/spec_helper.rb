ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require_relative "./../app"
require 'rack/test'
require 'capybara/rspec'
include Rack::Test::Methods

def app
  App
end

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
