require 'sinatra'
require 'active_record'
require 'mysql'

environment = ENV['RACK_ENV'] || 'development'
dbconfig    = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig[environment]

class App < Sinatra::Base

  Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
    require file.chomp(File.extname(file))
  end

end
