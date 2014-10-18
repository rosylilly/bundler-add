# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/add/version'

Gem::Specification.new do |spec|
  spec.name          = 'bundler-add'
  spec.version       = Bundler::Add::VERSION
  spec.authors       = ['Sho Kusano']
  spec.email         = ['rosylilly@aduca.org']
  spec.summary       = 'provides bundler-add command'
  spec.homepage      = 'https://github.com/rosylilly/bundler-add'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'thor', '~> 0.19.1'
end
