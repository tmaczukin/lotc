require 'lotc/builder/shared_examples/builder'

# LOTC module
#
module LOTC
  describe Builder::Deploy do
    subject do
      -> { Builder::Deploy.new }
    end

    before do
      @builded_type = LOTC::Deploy
    end

    it_behaves_like 'builder'
  end
end
