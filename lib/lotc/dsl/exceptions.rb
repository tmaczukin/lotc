module LOTC
  module DSL
    class DSLError < RuntimeError; end
    class NoManifestNameError < DSLError; end
  end
end
