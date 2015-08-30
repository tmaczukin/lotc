module LOTC
  module Builder
    # Container class
    #
    class Container
      include Builder

      def build
        LOTC::Container.new
      end
    end
  end
end
