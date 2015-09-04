require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Container do
    let(:object_to_add) { LOTC::Container.new }
    let(:builder_to_add) { LOTC::Builder::Container.new }
    let(:object_type) { LOTC::Container }

    subject { -> { Resolver::Container.new } }

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
