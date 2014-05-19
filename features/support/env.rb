ENV['RACK_ENV'] = 'test'

require 'capybara/cucumber'
require 'debugger'
require 'database_cleaner'
require_relative './../../app'

Capybara.app = App

DatabaseCleaner.strategy = :transaction

Before do
  DatabaseCleaner.start
end

Before do
  DatabaseCleaner.clean
end
