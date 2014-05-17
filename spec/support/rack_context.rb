shared_context "rack" do
  include Rack::Test::Methods

  def app
    App
  end
end
