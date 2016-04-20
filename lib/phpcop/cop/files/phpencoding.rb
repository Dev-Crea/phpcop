module PhpCop
  module Cop
    module Files
      # This class test file php use correctly encoding type
      class PhpEncoding < Cop
        MSG_ALERT_DESCRIB = 'Is not encoding in UTF-8 without BOM.'.freeze

        def initialize(file, line)
          super(file, line)
        end

        def test_line(line)
          # Parse line and test if line is correctly enconding
          if line.enconding == 'Encoding:UTF-8'
            true
          else
            return_an_error(@file, @line, 0)
            false
          end
        end
      end
    end
  end
end
