# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  module Cop
    module Files
      # This class test file php use correctly tags PHP '<?php ?>' or '<?= ?>'
      class PhpTags < Cop
        attr_reader :count_open, :count_close

        MSG_ALERT_DESCRIB = 'Dont use correctly PHP Tags.'
        TAG_OPEN = ['\<\?php', '\<\?='].freeze
        TAG_CLOSE = ['\?\>'].freeze

        def initialize(file, path, line = nil, line_number = nil)
          super(file, path, line, line_number)
        end

        def test_counters
          # Test if tags open is equal to tags close
          return_an_error(MSG_ALERT_DESCRIB) unless @count_open == @count_close
        end

        # Parse line and test if line use correctly tags PHP
        def test_line(line, line_number)
          @line = line
          @line_number = line_number
          # Parse file and search tags exists
          parse_and_search_open_tag
          # If file contains tag <?php or <?= search close tags
          parse_and_search_close_tag
        end

        private

        # Parse file and search tags
        def parse_and_search_open_tag
          TAG_OPEN.each do |rule|
            @count_open += 1 if match_line(rule)
          end
        end

        def parse_and_search_close_tag
          TAG_CLOSE.each do |rule|
            @count_close += 1 if match_line(rule)
          end
        end

        def match_line(rule)
          Regexp.new(rule).match @line.encode('UTF-16be',
                                              invalid: :replace,
                                              replace: '?').encode('UTF-8')
        end
      end
    end
  end
end
