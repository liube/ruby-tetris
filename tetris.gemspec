# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tetris/version'

Gem::Specification.new do |spec|
  spec.name          = "tetris"
  spec.version       = Tetris::VERSION
  spec.authors       = ["liube"]
  spec.email         = ["liub4o7@yahoo.com"]
  spec.summary       = %q{My version of tetris as a Ruby project in university.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  #gem.add_development_dependency 'rspec'
  #gem.add_development_dependency 'rake'
end