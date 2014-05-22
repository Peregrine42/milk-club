require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/flash'

ActiveRecord::Base.logger = nil

class App < Sinatra::Base
  Dir[File.join(Sinatra::Application.root, 'app', 'helpers', '**', '*.rb')].each { |f| require f }

  extend AdminOnlyHelper
  extend MemberOnlyHelper

  Dir[File.join(Sinatra::Application.root, 'app', 'models', '**', '*.rb')].each { |f| require f }
  Dir[File.join(Sinatra::Application.root, 'app', 'controllers', '**', '*.rb')].each { |f| require f }
  Dir[File.join(Sinatra::Application.root, 'lib', '*.rb')].each { |f| require f }

  set :views, Proc.new { File.join(Sinatra::Application.root, 'app', 'views') }

  enable :sessions
  register Sinatra::Flash


  helpers AuthenticationHelper

  def self.configuration
    @config ||= Configuration.load
  end
end
