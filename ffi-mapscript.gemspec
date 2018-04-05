# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffi-mapscript/version'

Gem::Specification.new do |spec|
  spec.name          = 'ffi-mapscript'
  spec.version       = FFI::Mapscript::VERSION
  spec.authors       = ['Steve Loveless']
  spec.email         = ['steve@agrian.com']
  spec.summary       = 'Drop-in replacement for SWIG mapscript'
  spec.description   = spec.summary
  spec.homepage      = 'http://bitbucket.org/agrian/ffi-mapscript'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ffi'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
