require 'capybara/cucumber'
require 'debugger'
require 'database_cleaner'
require_relative './../../app'

Capybara.app = App

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
end
