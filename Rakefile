require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'
require './app'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--wip"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--color"
end

task :default => [:features, :spec]
