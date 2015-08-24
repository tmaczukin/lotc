require 'lotc/version'
require 'lotc/exceptions'

# LOTC module
#
module LOTC
  autoload :Manifest,         'lotc/manifest'
  autoload :ContainerBuilder, 'lotc/container_builder'

  module DSL
    autoload :Manifest, 'lotc/dsl/manifest'
  end
end
