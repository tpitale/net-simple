# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{net-simple}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tony Pitale"]
  s.date = %q{2009-05-02}
  s.email = %q{tpitale@gmail.com}
  s.files = ["README.textile", "Rakefile", "lib/net", "lib/net/simple", "lib/net/simple/version.rb", "lib/net/simple.rb", "test/unit/net_simple_test.rb"]
  s.homepage = %q{http://t.pitale.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple wrapper for net/ssh and net/scp}
  s.test_files = ["test/unit/net_simple_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>, ["~> 2.0.10"])
      s.add_runtime_dependency(%q<net-scp>, ["~> 1.0.1"])
    else
      s.add_dependency(%q<net-ssh>, ["~> 2.0.10"])
      s.add_dependency(%q<net-scp>, ["~> 1.0.1"])
    end
  else
    s.add_dependency(%q<net-ssh>, ["~> 2.0.10"])
    s.add_dependency(%q<net-scp>, ["~> 1.0.1"])
  end
end
