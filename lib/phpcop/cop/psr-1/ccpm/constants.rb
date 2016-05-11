# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    # Acronym to Class Constants, Properties and Methods
    module CCPM
      # Test constant in php class
      class Constants < Cop
        MSG_ALERT_DESCRIB = 'Class constants MUST be declared in all upper '\
         'case with underscore separators.'

        def initialize(file, path, line, line_number)
          super(file, path, line, line_number)
          test_line
        end

        private

        def test_line
          test_constant_valid if @line.include?(' const ')
        end

        def test_constant_valid
          name = @line.slice!(/const.*=/)
          unless name.nil?
            name = name.gsub('const ', '').gsub(' =', '')
            n_constant = name.upcase
            return_an_error(MSG_ALERT_DESCRIB) unless n_constant.eql? name
          end
        end
      end
    end
  end
end
