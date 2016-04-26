# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    # Generic class for all rules
    class Cop
      attr_reader :errors
      # Display an error 'fichier.ext:line:column'
      MSG_ALERT_FILE = '%s/%s:%s:%s'

      def initialize(file, path, line, line_number)
        @count_open = 0
        @count_close = 0
        @errors = 0
        @path = path
        @file = file
        @line = line.to_s
        @line_number = line_number
      end

      private

      def return_an_error(message_alert_describ)
        @errors += 1
        puts format('line number : %s', @line_number)
        @line_number += 1
        @column = 0
        puts format(MSG_ALERT_FILE, @path, @file, @line_number, @column)
        puts message_alert_describ
        puts ''
      end
    end
  end
end
