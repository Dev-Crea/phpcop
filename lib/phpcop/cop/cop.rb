module PhpCop
  module Cop
    # Generic class for all rules
    class Cop
      attr_reader :errors
      # Display an error 'fichier.ext:line:column'
      MSG_ALERT_FILE = '%s:%s:%s'.freeze

      def initialize(file, line, line_number)
        @count_open = 0
        @count_close = 0
        @errors = 0
        @file = file
        @line = line
        @line_number = line_number
      end

      private

      def return_an_error(file, line, column)
        @errors += 1
        line += 1
        puts format(MSG_ALERT_FILE, file, line, column)
      end
    end
  end
end
