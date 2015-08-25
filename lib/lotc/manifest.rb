module LOTC
  # Manifest class
  #
  class Manifest
    attr_reader :images, :containers

    def initialize(contents)
      @images = {}
      @containers = {}

      DSL::Manifest.new(self, contents) if contents
    end

    def add_image(name, image)
      raise DSL::DuplicateImageNameError, "Image name '#{name}' was already used" if
        @images.key?(name)

      @images[name] = image
    end

    def add_container(name, container)
      raise DSL::DuplicateContainerNameError, "Container name '#{name}' was already used" if
        @containers.key?(name)

      @containers[name] = container
    end
  end
end
