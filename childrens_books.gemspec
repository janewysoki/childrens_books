lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "childrens_books/version"

Gem::Specification.new do |spec|
  spec.name          = "childrens_books"
  spec.version       = ChildrensBooks::VERSION
  spec.authors       = ["janewysoki"]
  spec.email         = ["jane.wysoki@gmail.com"]

  spec.summary       = %q{"50 Books Children Should Read Before They Turn 12"}
  spec.description   = %q{"Suggests books for a child to read based on their age."}
  spec.homepage      = "https://github.com/janewysoki/childrens_books"
  spec.license       = "MIT"

  #spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/janewysoki/childrens_books"
  spec.metadata["changelog_uri"] = "https://github.com/janewysoki/childrens_books"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         =  Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #["lib/childrens_books.rb", "lib/childrens_books/cli.rb", "lib/childrens_books/book.rb", "lib/childrens_books/scraper.rb", "lib/childrens_books/version.rb", "config/environment.rb"]
  #spec.bindir        = "exe"
  spec.executables   = ["childrens_books"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri", "~> 1.10"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_dependency "colorize", "~> 0.8.1"
end
