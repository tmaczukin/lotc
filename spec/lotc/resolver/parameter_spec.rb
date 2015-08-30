require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Parameter do
    subject do
      -> { Resolver::Parameter.new }
    end

    before do
      @object_to_add = LOTC::Parameter.new
    end

    it_behaves_like 'standard resolver'
  end
end
