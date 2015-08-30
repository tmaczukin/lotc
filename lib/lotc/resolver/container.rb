module LOTC
  module Resolver
    # Container tasks
    #
    class Container
      include Standard
      include Building

      valid_object_type LOTC::Container
      valid_builder_type LOTC::Builder::Container
    end
  end
end
