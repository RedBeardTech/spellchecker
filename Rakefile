require "bundler"
require "rake"
require 'rake/testtask'

Bundler::GemHelper.install_tasks

Rake::TestTask.new(:test) do |t|
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
  t.warning = true
end

task :default => :test
