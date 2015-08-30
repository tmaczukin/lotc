require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Task do
    subject do
      -> { Builder::Task.new }
    end

    before do
      @builded_type = LOTC::Task
    end

    it_behaves_like 'builder'
  end
end
