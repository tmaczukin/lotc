require 'lotc/version'

# LOTC module
#
module LOTC
  autoload :Manifest, 'lotc/manifest'

  # Resolver module
  #
  module Resolver
    autoload :Container, 'lotc/resolver/container'
    autoload :Deploy,    'lotc/resolver/deploy'
    autoload :Image,     'lotc/resolver/image'
    autoload :Parameter, 'lotc/resolver/parameter'
    autoload :Stack,     'lotc/resolver/stack'
    autoload :Stage,     'lotc/resolver/stage'
    autoload :Task,      'lotc/resolver/task'
  end
end
