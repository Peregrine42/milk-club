require 'sinatra'
require 'sinatra/flash'
require 'mysql'
require 'sinatra/activerecord'

ActiveRecord::Base.logger = nil

class App < Sinatra::Base
  set :views, Proc.new { File.join(Sinatra::Application.root, 'app', 'views') }

  enable :sessions
  register Sinatra::Flash

  Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
    require file.chomp(File.extname(file))
  end

end
