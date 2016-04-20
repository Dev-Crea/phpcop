module PhpCop
  # Store configuration of gems.
  # Parse config file and test if option is enabled
  class ConfigStore
    attr_reader :options

    def initialize
      opt = ConfigLoader.new
      @options = opt.options
    end
  end
end
