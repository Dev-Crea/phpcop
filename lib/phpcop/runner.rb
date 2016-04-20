module PhpCop
  # This class runner
  class Runner
    EXT = %w(.php .phtml .php.dist).freeze
    EXCLUDE_FOLDER = %w(. .. .git .gitignore vendor).freeze

    attr_reader :count_files, :count_errors

    def initialize(config_store)
      @count_files = 0
      @count_errors = 0
      @conf = config_store
      @rules = @conf.rules
      @types = { files: false }

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
      file_with_path = format('%s/%s', path, file)
      # Execute all test in file
      f = File.open(file_with_path, 'r')
      while (line = f.gets)
        parse_file(file, line)
      end
=begin
      types_default
      @rules.each do |value|
        case value.type
        when 'files'
          test_file(file_with_path, value.type) unless @types['files']
        end
      end
=end
    end

    def parse_file(file, line)
      @rules.each do |value|
        case value.name
        when 'phpTags'
          test_file_php_tags(file, line) if value.enabled
        when 'phpEncoding'
          test_file_php_encoding(file, line) if value.enabled
        end
      end
    end
=begin
    def test_file(file, type)
      @conf.rules_by_type(type).each do |value|
        case value.name
        when 'phpTags'
          test_file_php_tags(file) if value.enabled
        when 'phpEncoding'
          test_file_php_encoding if value.enabled
        end
      end
      @types['files'] = true
    end
=end
    def test_file_php_tags(file, line)
      test = PhpCop::Cop::Files::PhpTags.new(file, line)
      @count_errors += test.errors
    end

    def test_file_php_encoding(file, line)
      test = PhpCop::Cop::Files::Encoding.new(file, line)
      @count_errors += test.errors
    end
=begin
    def types_default
      @types.map { |k, _| @types[k] = false }
    end
=end
  end
end
