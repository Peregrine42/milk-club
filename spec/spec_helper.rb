require 'capybara/rspec'
require 'rack/test'

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each do |file|
  require file.chomp(File.extname(file))
end

require_relative './../app'

RSpec.configure do |config|
  config.color_enabled = true
end

#include Rack::Test::Methods

#def app
  #App
#end
