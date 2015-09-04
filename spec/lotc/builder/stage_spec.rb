require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Stage do
    let(:builded_type) { LOTC::Stage }
    subject { Builder::Stage.new }

    it_behaves_like 'builder'
  end
end
