# encoding: utf-8
# frozen_string_literal: true

require 'yaml'

module PhpCop
  # This class load a files configuration to gem. So config file default and
  # customize config file in project scan
  class ConfigLoader
    attr_reader :options

    # Path to gem
    DEFAULT_PATH = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    # Config file in gem
    DEFAULT_CONF = File.join(DEFAULT_PATH, 'config', 'default.yml')
    # Config file in project PHP
    CUSTOMIZE_CONF = '.phpcop.yml'

    def initialize
      @options = load_configuration(DEFAULT_CONF)
      override_configuration(File.join(Dir.pwd, CUSTOMIZE_CONF))
    end

    private

    def load_configuration(file)
      YAML.load(File.read(file))
    end

    def override_configuration(file)
      @options = load_configuration(file) if File.exist?(file)
    end
  end
end
