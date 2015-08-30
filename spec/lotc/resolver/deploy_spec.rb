require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Deploy do
    subject do
      -> { Resolver::Deploy.new }
    end

    before do
      @object_to_add = LOTC::Deploy.new
      @builder_to_add = LOTC::Builder::Deploy.new
    end

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
