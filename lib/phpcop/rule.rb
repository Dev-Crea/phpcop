module PhpCop
  # Object represent a rule in yaml configuration file
  class Rule
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
