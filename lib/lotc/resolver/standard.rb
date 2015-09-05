module LOTC
  module Resolver
    # Standard module
    #
    module Standard
      def initialize
        @objects = {}

        super
      end

      def self.included(parent_class)
        parent_class.extend(ClassMethods)
      end

      def add(name, value)
        self.class.check_object_type(value)
        raise DuplicatedNameError, "Duplicated object name '#{name}'" if contains?(name)

        @objects[name] = value
      end

      def get(name)
        raise NotAddedObjectError, "Object with name '#{name}' was not added to resolver" unless contains?(name)

        @objects[name]
      end

      def contains?(name)
        @objects.key?(name)
      end

      def count
        @objects.count
      end

      private

      # ClassMethods for LOTC::Resolver::Standard
      #
      module ClassMethods
        def valid_object_type(type)
          @valid_object_type = type
        end

        def check_object_type(value)
          return unless @valid_object_type

          raise LOTC::InvalidObjectError, "Object should be a '#{@valid_object_type}'. '#{value.class}' given." unless
            value.is_a?(@valid_object_type)
        end
      end
    end
  end
end
