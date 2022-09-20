# frozen_string_literal: true

require_relative "lib/angle_brackets/version"

Gem::Specification.new do |spec|
  spec.name = "angle_brackets"
  spec.version = AngleBrackets::VERSION
  spec.authors = ["sixpeteunder"]
  spec.email = ["plenjo15@gmail.com"]

  spec.summary = "Angle Brackets."
  spec.description = "Longer description of angle brackets."
  spec.homepage = "https://github.com/sixpeteunde/angle_brackets"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https:/github.com/sixpeteunder/angle_brackets"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "sorbet"
  spec.add_development_dependency "tapioca"
  spec.add_dependency "sorbet-runtime"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
