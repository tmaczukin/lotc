require 'lotc/resolver/shared_examples/standard_resolver'

module LOTC
  module Resolver
    describe Stack do
      subject do
        -> { Stack.new }
      end

      it_behaves_like 'standard resolver'
    end
  end
end
