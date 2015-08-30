require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Container do
    subject do
      -> { Resolver::Container.new }
    end

    before do
      @object_to_add = LOTC::Container.new
      @builder_to_add = LOTC::Builder::Container.new
    end

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
