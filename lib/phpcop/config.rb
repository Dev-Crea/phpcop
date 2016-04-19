require 'yaml'

# Module PHP Cop
module Phpcop
  # Configuration to gem
  class Config
    def initialize
      YAML.load('config/default.yml')
    end
  end
end
