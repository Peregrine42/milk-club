require 'sinatra'
require 'mysql'
require 'sinatra/activerecord'

ActiveRecord::Base.logger = nil

class App < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), 'app')

  Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
    require file.chomp(File.extname(file))
  end

end
