require 'lotc/resolver/shared_examples/standard_resolver'

module LOTC
  module Resolver
    describe Image do
      subject do
        -> { Image.new }
      end

      it_behaves_like 'standard resolver'
    end
  end
end
