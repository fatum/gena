$:.push File.expand_path("../lib", __FILE__)

require 'gena/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gena"
  s.version     = Gena::VERSION
  s.authors     = ["Maxim Filippovich"]
  s.email       = ["fatumka@gmail.com"]
  s.homepage    = "http://twitter.com/mfilippovich"
  s.summary     = "Deploy generator for AggregationPlatform"
  s.description = "Bootstrap all needable config for deploy and run AggregationPlatform's project"
  s.executables   = ["gena"]
  s.files = Dir["{lib,bin,templates}/**/*"] + ["Rakefile", "README.md", "Gemfile"]

  s.add_dependency "thor"
  s.add_development_dependency "rake"
end
