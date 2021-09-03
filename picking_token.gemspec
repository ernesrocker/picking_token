lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "picking_token/version"

Gem::Specification.new do |spec|
  spec.name          = "PickingToken"
  spec.version       = PickingToken::VERSION
  spec.authors       = ["Ernesto"]
  spec.email         = ["ernes920825@gmail.com"]

  spec.summary       = "Picking problem"
  spec.description   = "https://gist.github.com/luctus/3db17f4eb1a6d32eebaceb86afcc30e2"
  spec.homepage      = "https://github.com/ernesrocker/picking_token.git"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "json"
end
