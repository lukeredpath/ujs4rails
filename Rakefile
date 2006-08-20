require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'fileutils'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the unobtrusive_javascript plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the unobtrusive_javascript plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'UnobtrusiveJavascript'
  rdoc.options << '--line-numbers' << '--inline-source' << '--accessor=cattr_accessor'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Updates application with the necessary javascripts for unobtrusive_javascript.'
task :update_scripts do
  FileUtils.cp Dir['assets/javascripts/*.js'], '../../../public/javascripts'
end

desc 'Removes the javascripts for the plugin.'
task :remove_scripts do
  FileUtils.rm %{lowpro.js}.collect { |f| "../../../public/javascripts/" + f  }
end
