module PhpCop
  # Object represent a rule in yaml configuration file
  class Rule
    attr_reader :name, :enabled, :description, :see

    def initialize(name, option = {})
      @name = name
      @enabled = option.enabled
      @description = option.description
      @see = option.see
    end
  end
end
