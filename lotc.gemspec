# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lotc/version'

Gem::Specification.new do |spec|
  spec.name          = 'lotc'
  spec.version       = LOTC::VERSION
  spec.authors       = ['Tomasz Maczukin']
  spec.email         = ['tomasz@maczukin.pl']
  spec.license       = 'MIT'
  spec.summary       = ''
  spec.homepage      = 'https://github.com/tmaczukin/lotc'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/^spec/) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',   '~> 1.10'
  spec.add_development_dependency 'rake',      '~> 10.0'
  spec.add_development_dependency 'rubocop',   '~> 0.31.0'
  spec.add_development_dependency 'rspec',     '~> 3.3.0'
  spec.add_development_dependency 'pry',       '~> 0.10.1'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
end
