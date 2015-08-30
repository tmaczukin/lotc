require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Image do
    subject do
      -> { Resolver::Image.new }
    end

    before do
      @object_to_add = LOTC::Image.new
    end

    it_behaves_like 'standard resolver'
  end
end
