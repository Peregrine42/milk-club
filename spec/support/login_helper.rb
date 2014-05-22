module LoginHelper

  def get_as_admin url, params = {}
    get url, params, 'rack.session' => {name: 'An Admin', role: 'Admin', ein: '1'}
  end

  def get_as_user url, params = {}
    get url, params, 'rack.session' => {name: 'A User', role: 'User', ein: '1'}
  end

  def post_as_admin url, params = {}
    post url, params, 'rack.session' => {name: 'An Admin', role: 'Admin', ein: '1'}
  end

  def post_as_user url, params = {}
    post url, params, 'rack.session' => {name: 'A User', role: 'User', ein: '1'}
  end
end

RSpec.configure do |config|
  config.include LoginHelper
end
