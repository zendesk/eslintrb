# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "eslintrb/version"

Gem::Specification.new do |s|
  s.name        = "eslintrb"
  s.version     = Eslintrb::VERSION
  s.authors     = ["ocke", "stereobooster"]
  s.email       = ["ocke@exploder.nl", "stereobooster@gmail.com"]
  s.homepage    = "https://github.com/zendesk/eslintrb"
  s.summary     = %q{Ruby wrapper for ESLint}
  s.description = %q{Ruby wrapper for ESLint. Uses ExecJS}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "submodule", ">=0.0.3"
  s.add_runtime_dependency "rake"

  s.add_dependency "multi_json", ">= 1.3"
  s.add_dependency "execjs"
end
