require 'lotc/dsl/exceptions'

module LOTC
  class DuplicatedNameError < RuntimeError; end
  class InvalidObjectError < ArgumentError; end
  class InvalidBuilderError < ArgumentError; end
  class NotAddedObjectError < RuntimeError; end
  class NotAddedBuilderError < RuntimeError; end
end
