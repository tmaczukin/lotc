module LOTC
  module Resolver
    # Building module
    #
    module Building
      include Standard

      def initialize
        @builders = {}

        super
      end

      def add_builder(name, builder)
        raise DuplicatedNameError, "Duplicated builder object name '#{name}'" if contains_builder?(name)
        @builders[name] = builder
      end

      def contains_builder?(name)
        @builders.key?(name)
      end
    end
  end
end
