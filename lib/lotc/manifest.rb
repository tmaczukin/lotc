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
  end
end
