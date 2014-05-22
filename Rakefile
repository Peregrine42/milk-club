ENV['RACK_ENV'] ||= 'test'

require 'sinatra/activerecord/rake'

Dir["#{File.dirname(__FILE__)}/lib/tasks/**/*.rake"].sort.each { |r| load r }

require_relative './app.rb'
