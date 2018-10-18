require 'bundler/setup'
require 'rspec/core/rake_task'
import 'lib/tasks/helix_runtime.rake'

RSpec::Core::RakeTask.new(:spec)

task :demo => :build do
  require 'konuezu_rust'
  KonuezuRust.random.play!
end

task :spec => :build
task :default => :spec
