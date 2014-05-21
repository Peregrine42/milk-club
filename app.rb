require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/flash'

ActiveRecord::Base.logger = nil

class App < Sinatra::Base
  Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
    require file.chomp(File.extname(file))
  end
  Dir[File.join(Sinatra::Application.root, 'lib', '*.rb')].each { |f| require f }

  set :views, Proc.new { File.join(Sinatra::Application.root, 'app', 'views') }

  enable :sessions
  register Sinatra::Flash

  extend AdminOnlyHelper
  extend MemberOnlyHelper

  helpers AuthenticationHelper

  def self.configuration
    @config ||= Configuration.load
  end
end
