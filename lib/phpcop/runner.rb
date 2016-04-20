module PhpCop
  # This class runner
  class Runner
    EXT = %w(.php .phtml .php.dist).freeze
    EXCLUDE_FOLDER = %w(. .. .git .gitignore vendor).freeze

    attr_reader :count_files, :count_errors

    def initialize(rules)
      @count_files = 0
      @count_errors = 0
      @rules = rules

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

    # Test each rules
    def execute_tests_in_file(file, path)
      @count_files += 1
      @rules.each do |value|
        case value.type
        when 'files'
          test_file(file, path)
        end
      end
    end

    def test_file(file, path)
      @rules.each do |value|
        case value.name
        when 'phpTags'
          test_file_php_tags(file, path) if value.enabled
        when 'phpEncoding'
          test_file_php_encoding if value.enabled
        end
      end
    end

    def test_file_php_tags(file, path)
      test = PhpCop::Cop::Files::PhpTags.new(format('%s/%s', path, file))
      @count_errors += test.errors
    end

    def test_file_php_encoding
      true
    end
  end
end
