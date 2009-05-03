require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/net/simple/version'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name            = 'net-simple'
  s.version         = NetSimple::Version.to_s
  s.summary         = "Simple wrapper for net/ssh and net/scp"
  s.author          = 'Tony Pitale'
  s.email           = 'tpitale@gmail.com'
  s.homepage        = 'http://t.pitale.com'
  s.files           = %w(README.textile Rakefile) + Dir.glob("lib/**/*")
  s.test_files      = Dir.glob("test/**/*_test.rb")

  s.add_dependency('net-ssh', '~> 2.0.10')
  s.add_dependency('net-scp', '~> 1.0.1')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end

begin
  require 'rcov/rcovtask'
  
  desc "Generate RCov coverage report"
  Rcov::RcovTask.new(:rcov) do |t|
    t.test_files = FileList['test/**/*_test.rb']
    t.rcov_opts << "-x lib/net/simple/version.rb"
  end
rescue LoadError
  nil
end
