require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Stack do
    subject do
      -> { Resolver::Stack.new }
    end

    before do
      @object_to_add = LOTC::Stack.new
    end

    it_behaves_like 'standard resolver'
  end
end
