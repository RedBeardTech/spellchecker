# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "spellchecker/version"

Gem::Specification.new do |s|
  s.name        = "spellchecker"
  s.version     = Spellchecker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["RedBeard Tech"]
  s.email       = ["mhodgson@redbeard-tech.com"]
  s.homepage    = "http://github.com/redbeard-tech/spellchecker"
  s.summary     = "A simple ruby spellchecking gem."
  s.description = "A simple ruby gem to provide basic spell checking and recommendations. Wraps the Aspell command line utility."

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("lib/**/*") + %w(README.markup LICENSE)
  s.require_path = 'lib'
end
