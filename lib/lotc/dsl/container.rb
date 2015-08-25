module LOTC
  module DSL
    # Container class
    #
    class Container
      def initialize(container_builder, &contents)
        @container_builder = container_builder
        @manifest = container_builder.manifest

        instance_eval(&contents) if contents
      end

      def image(image_name)
        raise NotAddedImageError,  "Image '#{image_name}' was not added in manifest" unless @manifest.images[image_name]

        @container_builder.image = @manifest.images[image_name]
      end

      def volume(container_path, host_path)
        @container_builder.add_volume(container_path, host_path)
      end

      def link(link_id, linked_container_id, wait_for = nil)
        container = @manifest.containers[linked_container_id]
        link = Link.new(container, wait_for)

        @container_builder.add_link(link_id, link)
      end

      def env(name, value)
        @container_builder.add_env(name, value)
      end

      def cmd(cmd)
        @container_builder.cmd = cmd
      end

      def tcp_port(container_port, host_port, host_addr = nil)
        @container_builder.add_port(:tcp, container_port, host_port, host_addr)
      end

      def udp_port(container_port, host_port, host_addr = nil)
        @container_builder.add_port(:udp, container_port, host_port, host_addr)
      end

      def tty(value)
        @container_builder.tty = value
      end

      def detach(value)
        @container_builder.detach = value
      end

      def read_only(value)
        @container_builder.read_only = value
      end

      def interactive(value)
        @container_builder.interactive = value
      end
    end
  end
end
