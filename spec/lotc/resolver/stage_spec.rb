require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Stage do
    subject do
      -> { Resolver::Stage.new }
    end

    before do
      @object_to_add = LOTC::Stage.new
      @builder_to_add = LOTC::Builder::Stage.new
    end

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
