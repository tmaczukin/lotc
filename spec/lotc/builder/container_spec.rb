require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Container do
    let(:builded_type) { LOTC::Container }
    subject { Builder::Container.new }

    it_behaves_like 'builder'
  end
end
