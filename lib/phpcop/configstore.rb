# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  # Store configuration of gems.
  # Parse config file and test if option is enabled
  class ConfigStore
    attr_reader :options, :rules

    def initialize
      opt = ConfigLoader.new
      @options = opt.options
      @rules = []

      @options.fetch('AllCops').each do |val|
        @rules.push PhpCop::Rule.new(val[0], val[1])
      end
    end

    def rules_by_type(type)
      @rules.select { |rule| rule.type.eql? type }
    end
  end
end
