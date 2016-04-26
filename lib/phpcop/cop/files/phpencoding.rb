# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    module Files
      # This class test file php use correctly encoding type
      class PhpEncoding < Cop
        MSG_ALERT_DESCRIB = 'Is not encoding in UTF-8 without BOM.'

        def initialize(file, path, line, line_number)
          super(file, path, line.to_s, line_number)
          test_line
        end

        private

        # Parse line and test if line is correctly enconding
        def test_line
          line_encoding = @line
          return_an_error unless line_encoding.ascii_only?
        end

        # TODO : Return position column to char non ASCII
        def column_number
          array = @line.split(/./)
          array.each_with_index { |c, index| index unless c.ascii_only? }
        end
      end
    end
  end
end
