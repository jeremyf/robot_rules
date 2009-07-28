# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{robot_rules}
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Edward Gray II", "Jeremy Friesen"]
  s.date = %q{2009-07-28}
  s.email = %q{jeremy.n.friesen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "lib/robot_rules.rb",
     "robot_rules.gemspec",
     "test/robot_rules_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/jeremyf/robot_rules}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A tool to determine if the robots.txt would prevent a given user agent from making a request to a given URI.}
  s.test_files = [
    "test/robot_rules_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
