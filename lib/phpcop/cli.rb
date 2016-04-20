module PhpCop
  # The CLI is a class responsible of handling all the command line interface
  # logic
  class CLI
    attr_reader :options, :config_store

    def initialize
      @options = {}
      @config_store = ConfigStore.new
    end

    # Run all files
    def run(_args = ARGV)
      runner = PhpCop::Runner.new
      puts format('%s fichier traité. %s erreurs.',
                  runner.count_files, runner.count_errors)
    end
  end
end
