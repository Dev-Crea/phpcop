module PhpCop
  module Cop
    module Files
      # This class test file php use correctly tags PHP '<?php ?>' or '<?= ?>'
      class PhpTags
        MSG_ALERT = 'Files ,%s, dont use correctly PHP Tags.'.freeze

        def initialize(file)
          @count_open = 0
          @count_close = 0

          puts format('Scan file : %s', file)

          # Open file and parse
          f = File.new(file, 'r')
          while (line = f.gets)
            parse_line(line)
          end

          # Test counters if there are equal
          test_counters(file)
        end

        private

        def parse_line(line)
          # Parse file and search tags exists
          @count_open += 1 if parse_and_search_open_tag(line)
          # If file contains tag <?php or <?= search close tags
          @count_close += 1 if parse_and_search_close_tag(line)
        end

        # Parse file and search tags
        def parse_and_search_open_tag(line)
          line.include? %w(<?php <?=)
        end

        def parse_and_search_close_tag(line)
          line.include? %w(?>)
        end

        def test_counters(file)
          return_an_error(file) if @count_open == @count_close
        end

        # Return a text error with file name
        def return_an_error(file)
          puts format(MSG_ALERT, file)
        end
      end
    end
  end
end
