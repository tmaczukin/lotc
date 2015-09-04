require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Stack do
    let(:object_to_add) { LOTC::Stack.new }

    subject { -> { Resolver::Stack.new } }

    it_behaves_like 'standard resolver'
  end
end
