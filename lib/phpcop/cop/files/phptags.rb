module PhpCop
  module Cop
    module Files
      # This class test file php use correctly tags PHP '<?php ?>' or '<?= ?>'
      class PhpTags
        MSG_ALERT = '%s, dont use correctly PHP Tags.'.freeze

        TAG_OPEN = ['\<\?php', '\<\?='].freeze
        TAG_CLOSE = ['\?\>'].freeze

        def initialize(file)
          @count_open = 0
          @count_close = 0

          # Open file and parse
          f = File.open(file, 'r')
          while (line = f.gets)
            parse_line(line)
          end

          # Test counters if there are equal
          test_counters(file)
        end

        private

        def parse_line(line)
          # Parse file and search tags exists
          parse_and_search_open_tag(line)
          # If file contains tag <?php or <?= search close tags
          parse_and_search_close_tag(line)
        end

        # Parse file and search tags
        def parse_and_search_open_tag(line)
          TAG_OPEN.each do |rule|
            @count_open += 1 if Regexp.new(rule).match line
          end
        end

        def parse_and_search_close_tag(line)
          TAG_CLOSE.each do |rule|
            @count_close += 1 if Regexp.new(rule).match line
          end
        end

        def test_counters(file)
          return_an_error(file) unless @count_open == @count_close
        end

        # Return a text error with file name
        def return_an_error(file)
          puts format(MSG_ALERT, file)
        end
      end
    end
  end
end
