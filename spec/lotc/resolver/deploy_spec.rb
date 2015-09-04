require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Deploy do
    let(:object_to_add) { LOTC::Deploy.new }
    let(:builder_to_add) { LOTC::Builder::Deploy.new }
    let(:object_type) { LOTC::Deploy }

    subject { -> { Resolver::Deploy.new } }

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
