ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require_relative "../app"

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
