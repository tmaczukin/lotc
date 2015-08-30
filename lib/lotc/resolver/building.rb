module LOTC
  module Resolver
    # Building module
    #
    module Building
      def initialize
        @builders = {}

        super
      end

      def self.included(parent_class)
        parent_class.extend(ClassMethods)
      end

      def add_builder(name, builder)
        self.class.check_builder_type(builder)
        raise DuplicatedNameError, "Duplicated builder object name '#{name}'" if contains_builder?(name)

        @builders[name] = builder
      end

      def contains_builder?(name)
        @builders.key?(name)
      end

      private

      # ClassMethods for LOTC::Resolver::Building
      #
      module ClassMethods
        def valid_builder_type(type)
          @valid_builder_type = type
        end

        def check_builder_type(builder)
          return unless @valid_builder_type

          raise LOTC::InvalidBuilderError,
                "Builder should be a '#{@valid_builder_type}'. '#{builder.class}' given." unless
                builder.is_a?(@valid_builder_type)
        end
      end
    end
  end
end
