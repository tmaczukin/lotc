module LOTC
  module Resolver
    # Stage class
    #
    class Stage
      include Standard
      include Building

      valid_object_type LOTC::Stage
      valid_builder_type LOTC::Builder::Stage
    end
  end
end
