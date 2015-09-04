require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Task do
    let(:object_to_add) { LOTC::Task.new }
    let(:builder_to_add) { LOTC::Builder::Task.new }
    let(:object_type) { LOTC::Task }

    subject { -> { Resolver::Task.new } }

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
