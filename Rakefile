require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'erb'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


task :update_require do
  File.open("lib/crystalize.rb", "w") do |f|
    f.write ERB.new(File.read("lib/crystalize.rb.erb")).result(binding)
  end
end

