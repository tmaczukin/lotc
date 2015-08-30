require 'lotc/resolver/shared_examples/standard_resolver'
require 'lotc/resolver/shared_examples/building_resolver'

module LOTC
  module Resolver
    describe Stage do
      subject do
        -> { Stage.new }
      end

      it_behaves_like 'standard resolver'
      it_behaves_like 'building resolver'
    end
  end
end