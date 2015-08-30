require 'lotc/resolver/shared_examples/standard_resolver'

module LOTC
  module Resolver
    describe Parameter do
      subject do
        -> { Parameter.new }
      end

      it_behaves_like 'standard resolver'
    end
  end
end
