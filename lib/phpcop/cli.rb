module PhpCop
  # The CLI is a class responsible of handling all the command line interface
  # logic
  class CLI
    EXT = %w('.php').freeze

    attr_reader :options, :config_store

    def initialize
      @options = {}
      @config_store = ConfigStore.new
    end

    # Run all files
    def run(_args = ARGV)
      Dir.foreach(Dir.pwd) do |file|
        unless file != '.' && file != '..'
          if File.directory?(file)
            foreach_folder(file)
          else
            execute_tests_in_file(file)
          end
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
      PhpCop::Cop::Files::PhpTags.new(file) if EXT.include?(File.extname(file))
    end
  end
end
