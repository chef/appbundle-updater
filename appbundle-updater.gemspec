lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "appbundle_updater/version"

Gem::Specification.new do |spec|
  spec.name          = "appbundle-updater"
  spec.version       = AppbundleUpdater::VERSION
  spec.authors       = ["lamont-granquist"]
  spec.email         = ["lamont@chef.io"]
  spec.description   = %q{Updates appbundled apps in Chef's omnibus packages}
  spec.summary       = spec.description
  spec.license       = "Apache-2.0"
  spec.homepage      = "https://github.com/chef/appbundle-updater"

  spec.files         = `git ls-files`.split($/).select { |x| !/^\./.match(x) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # This Gem DELIBERATELY has no dependencies other than the ruby stdlib
end
