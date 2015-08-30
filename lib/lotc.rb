require 'lotc/version'
require 'lotc/exceptions'

# LOTC module
#
module LOTC
  autoload :Manifest,  'lotc/manifest'
  autoload :Container, 'lotc/container'
  autoload :Deploy,    'lotc/deploy'
  autoload :Image,     'lotc/image'
  autoload :Parameter, 'lotc/parameter'
  autoload :Stage,     'lotc/stage'
  autoload :Stack,     'lotc/stack'
  autoload :Task,      'lotc/task'

  # Builder module
  #
  module Builder
    autoload :Container, 'lotc/builder/container'
    autoload :Deploy,    'lotc/builder/deploy'
    autoload :Stage,     'lotc/builder/stage'
    autoload :Task,      'lotc/builder/task'
  end

  # Resolver module
  #
  module Resolver
    autoload :Standard,  'lotc/resolver/standard'
    autoload :Building,  'lotc/resolver/building'

    autoload :Container, 'lotc/resolver/container'
    autoload :Deploy,    'lotc/resolver/deploy'
    autoload :Image,     'lotc/resolver/image'
    autoload :Parameter, 'lotc/resolver/parameter'
    autoload :Stack,     'lotc/resolver/stack'
    autoload :Stage,     'lotc/resolver/stage'
    autoload :Task,      'lotc/resolver/task'
  end
end
