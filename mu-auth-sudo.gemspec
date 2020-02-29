lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mu/version"

Gem::Specification.new do |spec|
  spec.name          = "mu-auth-sudo"
  spec.version       = Mu::AuthSudo::VERSION
  spec.authors       = ["Niels Vandekeybus"]
  spec.email         = ["niels.vandekeybus@redpencil.io"]

  spec.summary       = "ruby gem that provides a wrapper for sparql client that overrules access rights of queries in mu.semte.ch through a mu-auth-sudo header."
  spec.description   = "ruby gem that provides a wrapper for sparql client that overrules access rights of queries in mu.semte.ch through a mu-auth-sudo header."
  spec.homepage      = "https://github.com/redpencilio/mu-auth-sudo-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_dependency 'sparql-client', '~> 3.0.1'
end
