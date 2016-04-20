require 'yaml'

module PhpCop
  # This class load a files configuration to gem. So config file default and
  # customize config file in project scan
  class ConfigLoader
    # Config file in gem
    DEFAULT_CONF = 'config/default.yml'.freeze
    # Config file in project PHP
    CUSTOMIZE_CONF = '.phpcop.yml'.freeze

    def initialize
      load_configuration(DEFAULT_CONF)
      puts 'Erase default configuration.' if load_configuration(CUSTOMIZE_CONF)
    end

    private

    def load_configuration(file)
      File.exist?(file) ? YAML.load(file) : false
    end
  end
end
