module LOTC
  module DSL
    # Manifest class
    #
    class Manifest
      def initialize(contents)
        @manifest = LOTC::Manifest.new
        instance_eval(contents)
      end

      def get
        @manifest
      end

      private

      def name(value)
        @manifest.name = value
      end

      def maintainers(*maintainers)
        maintainers.each do |maintainer|
          @manifest.add_maintainer(maintainer)
        end
      end

      def image(name, *image_definition)
        image = LOTC::Image.new()

        @manifest.images.add(name, image)
      end

      def param(name, value)
        parameter = LOTC::Parameter.new

        @manifest.parameters.add(name, parameter)
      end
    end
  end
end
