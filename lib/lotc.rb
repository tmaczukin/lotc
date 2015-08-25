require 'lotc/version'
require 'lotc/exceptions'

# LOTC module
#
module LOTC
  autoload :Manifest,         'lotc/manifest'
  autoload :Image,            'lotc/image'
  autoload :Link,             'lotc/link'
  autoload :ContainerBuilder, 'lotc/container_builder'

  module DSL
    autoload :Manifest,  'lotc/dsl/manifest'
    autoload :Container, 'lotc/dsl/container'
  end
end
