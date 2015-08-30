module LOTC
  module Builder
    # Deploy class
    #
    class Deploy
      include Builder

      def build
        LOTC::Deploy.new
      end
    end
  end
end
