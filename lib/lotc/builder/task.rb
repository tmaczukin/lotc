module LOTC
  module Builder
    # Task class
    #
    class Task
      include Builder

      def build
        LOTC::Task.new
      end
    end
  end
end
