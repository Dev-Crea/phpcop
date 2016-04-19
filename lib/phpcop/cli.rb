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
      Dir.foreach('.') do |file|
        Logger.debug file
        if file.isDirectory?
          foreach_folder(file)
        else
          execute_tests_in_file(file)
        end
      end
    end

    private

    def foreach_folder(folder)
      Dir.foreach(folder) do |file|
        execute_tests_in_file(file)
      end
    end

    def execute_tests_in_file(file)
      PhpTags.new(file) if file.extname('.php')
    end
  end
end
