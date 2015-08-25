module LOTC
  module DSL
    # Manifest class
    #
    class Manifest

      def initialize(manifest, contents)
        @manifest = manifest

        instance_eval(contents)
      end

      def add_image(name, docker_image_name)
        @manifest.add_image(name, LOTC::Image.new(docker_image_name))
      end

      def define_container(name, parent_container_name = nil, &contents)
        @manifest.add_container(name, ContainerBuilder.create(@manifest, parent_container_name, &contents))
      end
    end
  end
end
