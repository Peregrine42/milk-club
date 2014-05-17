shared_context "rack" do
  require 'rack/test'
  require_relative './../../app'
  require 'capybara/rspec'
  include Rack::Test::Methods

  def app
    App
  end
end
