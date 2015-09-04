require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Task do
    let(:builded_type) { LOTC::Task }
    subject { Builder::Task.new }

    it_behaves_like 'builder'
  end
end
