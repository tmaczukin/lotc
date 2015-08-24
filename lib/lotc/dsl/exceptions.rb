module LOTC
  module DSL
    class ManifestError < ::RuntimeError; end
    class DuplicateImageNameError < ManifestError; end
    class DuplicateContainerNameError < ManifestError; end
  end
end
