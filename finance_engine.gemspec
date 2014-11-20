# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'finance_engine/version'

Gem::Specification.new do |spec|
  spec.name          = "finance_engine"
  spec.version       = FinanceEngine::VERSION
  spec.authors       = ["Jeffrey Penkar"]
  spec.email         = ["jspenkar@gmail.com"]
  spec.summary       = %q{Financial Engine Gem. Financial methods and tools.}
  spec.description   = %q{Financial Engine Gem. Functionality for put/call pricing, annuity valuation, Gordon Growht Model valuation, time value of money module, and hopefully more to come.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "distribution"
end
