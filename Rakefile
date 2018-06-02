require 'bundler/setup'
import 'lib/tasks/helix_runtime.rake'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :default => :spec
task :spec => :build
