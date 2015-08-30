module LOTC
  module Resolver
    # Task class
    #
    class Task
      include Standard
      include Building

      valid_object_type LOTC::Task
      valid_builder_type LOTC::Builder::Task
    end
  end
end
