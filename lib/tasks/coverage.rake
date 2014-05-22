if ENV['RACK_ENV'] != 'production'
  require "simplecov"

  namespace :coverage do

    task :check_specs do
      SimpleCov.coverage_dir 'log/coverage/spec'
      coverage = SimpleCov.result.covered_percent
      fail "Spec coverage was only #{coverage}%" if coverage < 80.0
    end
  end
end
