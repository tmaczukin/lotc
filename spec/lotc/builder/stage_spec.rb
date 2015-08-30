require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Stage do
    subject do
      -> { Builder::Stage.new }
    end

    before do
      @builded_type = LOTC::Stage
    end

    it_behaves_like 'builder'
  end
end
