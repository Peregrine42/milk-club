ENV['RACK_ENV'] = 'test'

require 'simplecov'

SimpleCov.start do
  add_filter    '/spec'
  coverage_dir  'log/coverage/spec'
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'database_cleaner'
require 'byebug'
require 'rack/test'
require 'rspec'
require 'timecop'

#ActiveRecord::Base.logger.level = 1

Dir[File.join(Sinatra::Application.root, 'spec', 'support', '**', '*.rb')].each { |f| require f }

set :run,           false
set :raise_errors,  true
set :logging,       false

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end

def app
  App
end
