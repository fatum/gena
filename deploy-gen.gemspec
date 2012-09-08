$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deploy-gen"
  s.version     = "0.0.1"
  s.authors     = ["Maxim Filippovich"]
  s.email       = ["fatumka@gmail.com"]
  s.homepage    = "http://twitter.com/mfilippovich"
  s.summary     = "Deploy generator for AggregationPlatform"
  s.description = "Bootstrap all needable config for deploy and run AggregationPlatform's project"
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = Dir["{lib,bin,templates}/**/*"] + ["Rakefile", "README.md", "Gemfile"]

  s.add_dependency "thor"
  s.add_development_dependency "rake"
end
