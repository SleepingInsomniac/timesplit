# coding: utf-8
lib = File.expand_path(File.join(__dir__, 'lib'))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "timesplit/version"

Gem::Specification.new do |spec|
  spec.name          = "timesplit"
  spec.version       = Timesplit::VERSION
  spec.authors       = ["Alex Clink"]
  spec.email         = ["code@alexclink.com"]

  spec.summary       = %q{Time split calculator!}
  spec.description   = <<~DESC
    Calculate times with splits for running, cycling, swimming, or whatever else.
  DESC
  spec.homepage      = "https://alexc.link/software/timesplit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'coveralls'
end
