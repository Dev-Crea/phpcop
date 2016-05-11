# encoding: utf-8
# frozen_string_literal: true

module PhpCop
  # Object represent a rule in yaml configuration file
  class Cop
    attr_reader :name, :type, :enabled, :description, :see

    def initialize(name, option = {})
      nt = name.split('/')
      @name = nt[1]
      @type = nt[0]
      @enabled = option['enabled']
      @description = option['description']
      @see = option['see']
    end
  end
end
