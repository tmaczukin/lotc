require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Parameter do
    let(:object_to_add) { LOTC::Parameter.new }

    subject { -> { Resolver::Parameter.new } }

    it_behaves_like 'standard resolver'
  end
end
