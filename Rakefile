require "bundler"
Bundler.setup

require "rake"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "spellchecker/version"

task :gem => :build
task :build do
  system "gem build spellchecker.gemspec"
end

task :install => :build do
  system "sudo gem install spellchecker-#{Spellchecker::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{Spellchecker::VERSION}..."
  system "git tag -a #{Spellchecker::VERSION} -m 'Tagging #{Spellchecker::VERSION}'"
  puts "Pushing to Github..."
  system "git push --tags"
  puts "Pushing to rubygems.org..."
  system "gem push spellchecker-#{Spellchecker::VERSION}.gem"
end

task :default => :build