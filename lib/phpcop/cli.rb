module PhpCop
  # The CLI is a class responsible of handling all the command line interface
  # logic
  class CLI
    EXT = %w(.php .phtml .php.dist).freeze
    EXCLUDE_FOLDER = %w(. .. .git .gitignore vendor).freeze

    attr_reader :options, :config_store, :count_files

    def initialize
      @options = {}
      @config_store = ConfigStore.new
      @count_files = 0
    end

    # Run all files
    def run(_args = ARGV)
      Dir.foreach(Dir.pwd) do |file|
        run_folder(file, Dir.pwd)
      end

      puts format('%s fichier traité. X erreurs.', @count_files)
    end

    private

    def foreach_folder(path)
      Dir.foreach(path) do |file|
        run_folder(file, path)
      end
    end

    def run_folder(file, path)
      unless EXCLUDE_FOLDER.include?(file)
        f = path + '/' + file
        if File.directory?(f)
          foreach_folder(f)
        elsif EXT.include?(File.extname(file))
          execute_tests_in_file(file, path)
        end
      end
    end

    def execute_tests_in_file(file, path)
      @count_files += 1
      PhpCop::Cop::Files::PhpTags.new(format('%s/%s', path, file))
    end
  end
end
