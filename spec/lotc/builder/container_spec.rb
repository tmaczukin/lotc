require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Container do
    subject do
      -> { Builder::Container.new }
    end

    before do
      @builded_type = LOTC::Container
    end

    it_behaves_like 'builder'
  end
end
