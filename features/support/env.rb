ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')
require 'capybara/cucumber'
require 'byebug'
require 'database_cleaner'
require 'crowd/cucumber'

WebMock.disable_net_connect!(:allow_localhost => true)

Capybara.app = App

DatabaseCleaner.strategy = :transaction

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
