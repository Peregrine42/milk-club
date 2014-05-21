require 'yaml'
require 'active_support/core_ext/hash'
require 'active_support/hash_with_indifferent_access'

class Configuration

  def self.load filename = nil
    environment = App.environment || :development
    filename    = filename ? filename : "#{File.dirname(__FILE__)}/../config/config.yml"

    all_config  = YAML.load_file(filename)
    config      = all_config[environment.to_s]

    HashWithIndifferentAccess.new(config)
  end
end
