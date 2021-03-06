# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  # Object represent a rule in yaml configuration file
  class Rule
    attr_reader :rule, :enabled, :see

    def initialize(name, option = {})
      nt = name.split('/')
      @rule = nt[0]
      @enabled = option['enabled']
      @see = option['see']
    end
  end
end
