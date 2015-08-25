module LOTC
  # ContainerBuilder class
  #
  class ContainerBuilder
    attr_accessor :image
    attr_accessor :cmd
    attr_reader :volumes
    attr_reader :links
    attr_reader :envs
    attr_reader :ports
    attr_reader :tty, :detach, :read_only, :interactive
    attr_reader :manifest

    def initialize(manifest)
      @manifest = manifest
      @volumes = {}
      @links = {}
      @envs = {}
      @cmd = nil
      @ports = {tcp: {}, udp: {}}

      @tty = false
      @detach = false
      @read_only = false
      @interactive = false
    end
    private :initialize

    def self.create(manifest, parent_container_name = nil, &contents)
      container_builder = if parent_container_name
                  clone_parent(parent_container_name, manifest)
                else
                  self.new(manifest) unless parent_container_name
                end

      DSL::Container.new(container_builder, &contents) if contents

      container_builder
    end

    def add_volume(host_path, container_path)
      @volumes[host_path] = container_path
    end

    def add_link(link_id, container_link)
      @links[link_id] = container_link
    end

    def add_env(name, value)
      @envs[name] = value
    end

    def add_port(type, container_port, host_port, host_container = nil)
      raise UnknownPortTypeError, "Unknown port type '#{type}'" unless type == :tcp || type == :udp

      @ports[type][container_port] = {port: host_port, addr: host_container}
    end

    def tty=(value)
      @tty = value && true
    end

    def detach=(value)
      @detach = value && true
    end

    def read_only=(value)
      @read_only = value && true
    end

    def interactive=(value)
      @interactive = value && true
    end

    def ==(other)
      return false unless image == other.image

      true
    end

    private

    def self.clone_parent(name, manifest)
      raise DSL::NotDefinedContainerError, "Container '#{name}' was not defined" unless manifest.containers[name]
      manifest.containers[name].clone
    end
  end
end
