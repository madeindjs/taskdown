
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "todown/version"

Gem::Specification.new do |spec|
  spec.name          = "todown"
  spec.version       = Todown::VERSION
  spec.authors       = ["Alexandre Rousseau", "madeindjs"]
  spec.email         = ["contact@rousseau-alexandre.fr"]

  spec.summary       = %q{Markdown + Task}
  spec.description   = %q{Extract task from your markdown file}
  spec.homepage      = "https://github.com/madeindjs/todown.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "bin"
  spec.executables   = ['todown']
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-table", "~> 1.8"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
