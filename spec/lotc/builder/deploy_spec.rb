require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Deploy do
    let(:builded_type) { LOTC::Deploy }
    subject { Builder::Deploy.new }

    it_behaves_like 'builder'
  end
end
