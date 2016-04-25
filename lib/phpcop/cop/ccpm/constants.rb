# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    # Acronym to Class Constants, Properties and Methods
    module CCPM
      # Test constant in php class
      class Constants < Cop
        MSG_ALERT_DESCRIB = 'Class constants MUST be declared in all upper case'
        MSG_ALERT_DESCRIB << ' with underscore separators.'

        def initialize(file, line, line_number)
          super(file, line.to_s, line_number)
          test_line
        end

        private

        def test_line
          test_constant_valid if @line.include?(' const ')
        end

        def test_constant_valid
          name = @line.slice!(/const.*=/)
          puts format('origin : %s', name)
          unless name.nil?
            name = name.gsub('const ', '').gsub(' =', '')
            n_constant = name.upcase
            puts format('o : %s - v : %s', name, n_constant)
            return_an_error(@file, @line_number, 0) unless n_constant.eql? name
          end
        end

        def return_an_error(file, line, column)
          @errors += 1
          line += 1
          puts format(MSG_ALERT_FILE, file, line, column)
          puts MSG_ALERT_DESCRIB
          puts ''
        end
      end
    end
  end
end
