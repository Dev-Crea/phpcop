# encoding: utf-8
# frozen_string_literal: true

require 'active_support/core_ext/string'

module PhpCop
  module Cop
    # Acronym to Class Constants, Properties and Methods
    module CCPM
      # Test method in php class
      class Methods < Cop
        MSG_ALERT_DESCRIB = 'Name method is not in camelCase().'

        def initialize(file, line, line_number)
          super(file, line.to_s, line_number)
          test_line
        end

        private

        def test_line
          test_camel_case_method if @line.include?(' function ')
        end

        def test_camel_case_method
          name = @line.slice!(/function.*()/).gsub('function ', '')
          name = name.gsub(/\(.*/, '')
          unless name.include?('__')
            name_camel = name.camelize(:lower)
            return_an_error(@file, @line_number, 0) unless name_camel.eql? name
          end
        end
      end
    end
  end
end
