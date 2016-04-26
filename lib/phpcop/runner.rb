# encoding: utf-8
# frozen_string_literal: true

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
      line_number = 0
      # Execute all test in file
      f = File.open(format('%s/%s', path, file), 'r')
      @php_tag = PhpCop::Cop::Files::PhpTags.new(file, path)
      while (line = f.gets)
        parse_file(file, line, line_number, path)
        line_number += 1
      end
      @php_tag.test_counters
      @count_errors += @php_tag.errors
    end

    def parse_file(file, line, line_number, path)
      @rules.each do |value|
        parse_rule(value, file, line, line_number, path) if value.enabled
      end
    end

    def parse_rule(rule, file, line, line_number, path)
      case rule.name
      when 'phpTags'
        test_file_php_tags(line, line_number)
      when 'phpEncoding'
        test_file_php_encoding(path, file, line, line_number)
      when 'methods'
        test_ccpm_methods(path, file, line, line_number)
      when 'constants'
        test_ccpm_constants(path, file, line, line_number)
      end
    end

    def test_file_php_tags(line, line_number)
      @php_tag.test_line(line, line_number)
    end

    def test_file_php_encoding(path, file, line, line_number)
      test = PhpCop::Cop::Files::PhpEncoding.new(file, path, line, line_number)
      @count_errors += test.errors
    end

    def test_ccpm_methods(path, file, line, line_number)
      test = PhpCop::Cop::CCPM::Methods.new(file, path, line, line_number)
      @count_errors += test.errors
    end

    def test_ccpm_constants(path, file, line, line_number)
      test = PhpCop::Cop::CCPM::Constants.new(file, path, line, line_number)
      @count_errors += test.errors
    end
  end
end
