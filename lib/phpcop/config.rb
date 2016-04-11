require 'yaml'

# Configuration to gem
module Phpcop
  class Config
    def initialize
      YAML.load('config/phpcop.yml')
    end
  end
end
