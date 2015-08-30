require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

# LOTC module
#
module LOTC
  describe Resolver::Task do
    subject do
      -> { Resolver::Task.new }
    end

    before do
      @object_to_add = LOTC::Task.new
      @builder_to_add = LOTC::Builder::Task.new
      @object_type = LOTC::Task
    end

    it_behaves_like 'standard resolver'
    it_behaves_like 'building resolver'
  end
end
