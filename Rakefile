# frozen_string_literal: true

require 'rake'
require 'rubocop/rake_task'

begin
  require 'bundler/setup'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts 'although not required, bundler is recommended for running the tests'
end
task default: :spec
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-performance'
  task.requires << 'rubocop-rspec'
end
