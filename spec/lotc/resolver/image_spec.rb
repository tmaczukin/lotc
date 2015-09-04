require 'lotc/resolver/shared_examples/standard_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Image do
    let(:object_to_add) { LOTC::Image.new }

    subject { -> { Resolver::Image.new } }

    it_behaves_like 'standard resolver'
  end
end
