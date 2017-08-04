# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "markets/version"

Gem::Specification.new do |spec|
  spec.name          = "markets"
  spec.version       = Markets::VERSION
  spec.authors       = ["Ronald Morgan"]
  spec.email         = ["ronm7581@gmail.com"]

  spec.summary       = %q{Markets}
  spec.description   = %q{Markets}
  spec.homepage      = "https://github.com/morningrunning/markets"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << 'markets'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
