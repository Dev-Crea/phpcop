module PhpCop
  # Store configuration of gems. Parse config file and test if option is enabled
  class ConfigStore
    def initialize
      ConfigLoader.new
    end
  end
end
