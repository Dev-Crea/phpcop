# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    module Files
      # This class test file php use correctly encoding type
      class PhpEncoding < Cop
        MSG_ALERT_DESCRIB = 'Is not encoding in UTF-8 without BOM.'

        def initialize(file, line, line_number)
          super(file, line.to_s, line_number)
          test_line
        end

        private

        # Parse line and test if line is correctly enconding
        def test_line
          line_encoding = @line
          unless line_encoding.ascii_only?
            return_an_error(@file, @line_number, 0)
          end
        end

        # TODO : Return position column to char non ASCII
        def column_number
          array = @line.split(/./)
          array.each_with_index { |c, index| index unless c.ascii_only? }
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
