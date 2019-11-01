lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "p2e_builder/version"

Gem::Specification.new do |spec|
  spec.name          = "p2e_builder"
  spec.version       = P2eBuilder::VERSION
  spec.authors       = ["kalmegati"]
  spec.email         = ["kalmegati@gmail.com"]

  spec.summary       = "CLI for Creating Pathfinder 2E Characters"
  spec.description   = "Ruby CLI for creating characters for Pathfinder 2nd Edition. Information scraped from http://2e.aonprd.com/, the Archives of Nethys."
  spec.homepage      = "https://github.com/KalMegati/pathfinder-2e-builder"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/KalMegati/pathfinder-2e-builder"
#  spec.metadata["changelog_uri"] = "https://github.com/KalMegati/pathfinder-2e-builder/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  
  spec.files = ["Archivist.rb", "Builder.rb", "Commander.rb", "p2e_builder.rb", "p2e_builder/version.rb"]
  
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "bundler", "~> 2.0"
end
