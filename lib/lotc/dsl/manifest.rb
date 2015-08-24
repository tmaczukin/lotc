module LOTC
  module DSL
    # Manifest class
    #
    class Manifest
      attr_reader :images, :containers

      def initialize(manifest, contents)
        @manifest = manifest

        instance_eval(contents)
      end

      def add_image(name, docker_image_name)
        raise DuplicateImageNameError, "Image name '#{name}' was already used" if
          @manifest.images.key?(name)

        @manifest.images[name] = docker_image_name
      end

      def define_container(name, &contents)
        raise DuplicateContainerNameError, "Container name '#{name}' was already used" if
          @manifest.containers.key?(name)

        @manifest.containers[name] = ContainerBuilder.new
      end
    end
  end
end
