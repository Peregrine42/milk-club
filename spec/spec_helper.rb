ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require_relative "./../app"
require 'rack/test'
require 'capybara/rspec'
include Rack::Test::Methods

Dir[File.join(Sinatra::Application.root, 'spec', 'support', '**', '*.rb')].each { |f| require f }

def app
  App
end

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
