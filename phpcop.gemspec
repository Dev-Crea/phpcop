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
  spec.homepage      = 'http://'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'overcommit', '~> 0.32.0'
  spec.add_development_dependency 'rubocop', '~> 0.38.0'
end
