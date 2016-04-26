# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  # The CLI is a class responsible of handling all the command line interface
  # logic
  class CLI
    attr_reader :config_store

    MSG_END = '%s fichiers traités. %s erreurs.'

    def initialize
      @config_store = ConfigStore.new
    end

    # Run all files
    def run(_args = ARGV)
      runner = PhpCop::Runner.new(@config_store)
      puts format(MSG_END,
                  format_count(runner.count_files),
                  format_count(runner.count_errors))
    end

    private

    def format_count(count)
      i = 0
      f = []
      count.to_s.reverse.split('').each do |letter|
        i += 1
        f.push(letter)
        i = add_space(f) if i == 3
      end
      f.join.to_s.reverse
    end

    def add_space(f)
      f.push(' ')
      0
    end
  end
end
