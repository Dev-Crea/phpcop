module PhpCop
  # The CLI is a class responsible of handling all the command line interface
  # logic
  class CLI
    attr_reader :options, :config_store

    def initialize
      @options = {}
      @config_store = ConfigStore.new
    end

    def run(args = ARGV)
    end
  end
end
