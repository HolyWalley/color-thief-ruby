# frozen_string_literal: true

require_relative "lib/color_thief_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "color-thief"
  spec.version = ColorThiefRuby::VERSION
  spec.authors = ["HolyWalley"]
  spec.email = ["yasha.krasnov@gmail.com"]

  spec.summary = "Ruby bindings to Rust's color-thief."
  spec.description = "Ruby bindings to Rust's color-thief."
  spec.homepage = "https://github.com/HolyWalley/color-thief-ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rutie', '~> 0.0.3'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
