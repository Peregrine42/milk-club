module LoginHelper

  def get_as_admin url, params = {}
    get url, params, 'rack.session' => {name: 'An Admin', role: 'Admin'}
  end

  def get_as_user url, params = {}
    get url, params, 'rack.session' => {name: 'A User', role: 'User'}
  end

  def post_as_admin url, params = {}
    post url, params, 'rack.session' => {name: 'An Admin', role: 'Admin'}
  end

  def post_as_user url, params = {}
    post url, params, 'rack.session' => {name: 'A User', role: 'User'}
  end
end

RSpec.configure do |config|
  config.include LoginHelper
end
