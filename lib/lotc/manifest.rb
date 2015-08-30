module LOTC
  # Manifest class
  #
  class Manifest
    attr_reader :containers, :deploys, :images, :parameters, :stacks, :stages, :tasks
    attr_reader :maintainers
    attr_accessor :name

    def initialize
      @containers = Resolver::Container.new
      @deploys = Resolver::Deploy.new
      @images = Resolver::Image.new
      @parameters = Resolver::Parameter.new
      @stacks = Resolver::Stack.new
      @stages = Resolver::Stage.new
      @tasks = Resolver::Task.new

      @maintainers = []
    end

    def add_maintainer(maintainer)
      @maintainers << maintainer
    end
  end
end
