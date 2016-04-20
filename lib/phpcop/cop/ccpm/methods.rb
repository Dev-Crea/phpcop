require 'active_record'

module PhpCop
  module Cop
    # Acronym to Class Constants, Properties and Methods
    module CCPM
      class Methods < Cop
        MSG_ALERT_DESCRIB = 'Name method is not in camelCase().'.freeze

        def initialize(file, line, line_number)
          super(file, line.to_s, line_number)
          test_line
        end

        private

        def test_line
          test_camel_case_method if @line.include?(' function ')
        end

        def test_camel_case_method
          name_method = @line.slice!(/function.*()/)
          name_method = name_method.chomp('function ')
          name_method = name_method.chomp('()')
          name_method_camel = name_method.to_s #.camelize(:lower)
          puts format('Original : %s - Camelize : %s', name_method,
                      name_method_camel)
          if name_method_camel === name_method
            puts 'Ok correct ...'
          end
        end
      end
    end
  end
end
