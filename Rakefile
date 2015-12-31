require "bundler/gem_tasks"

[:build, :install, :release].each do |task_name|
  Rake::Task[task_name].prerequisites << :spec
end

require "multi_json"

def eslint_version
  package = File.expand_path("../vendor/eslint/package.json", __FILE__)
  MultiJson.load(File.open(package, "r:UTF-8").read)["version"]
end

task :eslint_version do
  p eslint_version
end

require 'submodule'
Submodule::Task.new do |t|
    t.test do
      sh "npm i"
      sh "npm test"
      # sh "node bin/build"
    end

    t.after_pull do
      cp "vendor/eslint/build/eslint.js", "lib/js/eslint.js"
      sh "git add lib/js/eslint.js"
    end
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

task :default => :spec

#desc "Generate code coverage"
# RSpec::Core::RakeTask.new(:coverage) do |t|
  # t.rcov = true
  # t.rcov_opts = ["--exclude", "spec"]
# end
