module PhpCop
  # This class runner
  class Runner
    attr_accessor :count_files, :count_errors

    def initialize
      @count_files = 0
      @count_errors = 0

      Dir.foreach(Dir.pwd) do |file|
        run_folder(file, Dir.pwd)
      end
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
      test = PhpCop::Cop::Files::PhpTags.new(format('%s/%s', path, file))
      @count_errors += test.errors
    end
  end
end
