module LOTC
  # Resolver module
  #
  module Resolver
    # Standard module
    #
    module Standard

      def initialize
        @objects = {}

        super
      end

      def add(name, value)
        raise DuplicatedNameError, "Duplicated object name '#{name}'" if contains?(name)
        @objects[name] = value
      end

      def contains?(name)
        @objects.key?(name)
      end
    end
  end
end
