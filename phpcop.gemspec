# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phpcop/version'

Gem::Specification.new do |spec|
  spec.name          = 'phpcop'
  spec.version       = Phpcop::VERSION
  spec.authors       = ['Jeremy VAILLANT']
  spec.email         = ['vaillant.jeremy@dev-crea.com']

  spec.summary       = 'Parse PHP code and analyser.'
  spec.description   = 'Parser php files and gives non-respected guidelines.'
  spec.homepage      = 'https://github.com/Dev-Crea/phpcop'

  r = %r{^(test|spec|features)/}
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(r) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '~> 4.2', '>= 4.2.6'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'overcommit', '~> 0.32.0'
  spec.add_development_dependency 'rubocop', '~> 0.38.0'
end
