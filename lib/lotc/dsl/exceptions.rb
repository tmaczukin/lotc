module LOTC
  module DSL
    class ManifestError < ::RuntimeError; end

    class DuplicateImageNameError < ManifestError; end
    class DuplicateContainerNameError < ManifestError; end

    class NotAddedImageError < ManifestError; end
    class NotDefinedContainerError < ManifestError; end
  end
end
