module LOTC
  module Builder
    # Stage class
    #
    class Stage
      include Builder

      def build
        LOTC::Stage.new
      end
    end
  end
end
