ENV['RACK_ENV'] = 'test'
require 'database_cleaner'

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
