require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Stage do
    let(:object_to_add) { LOTC::Stage.new }
    let(:builder_to_add) { LOTC::Builder::Stage.new }
    let(:object_type) { LOTC::Stage }

    subject { -> { Resolver::Stage.new } }

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
