module LOTC
  module Resolver
    # Deploy class
    #
    class Deploy
      include Standard
      include Building

      valid_object_type LOTC::Deploy
      valid_builder_type LOTC::Builder::Deploy
    end
  end
end
