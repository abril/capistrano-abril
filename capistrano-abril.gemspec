# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capistrano-abril}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcus Vinicius Ferreira"]
  s.date = %q{2011-03-23}
  s.description = %q{Defaults and recipes used in our deployments. Based on 'capistrano-helpers' gem.}
  s.email = %q{ferreira.mv@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.markdown",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "capistrano-abril.gemspec",
    "lib/capistrano-abril.rb",
    "lib/capistrano-abril/branch.rb",
    "lib/capistrano-abril/bundler.rb",
    "lib/capistrano-abril/gems.rb",
    "lib/capistrano-abril/git.rb",
    "lib/capistrano-abril/multistage.rb",
    "lib/capistrano-abril/passenger.rb",
    "lib/capistrano-abril/php.rb",
    "lib/capistrano-abril/specs.rb",
    "lib/capistrano-abril/version.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/abril/capistrano-abril}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Defaults and recipes used in our deployments.}
  s.test_files = [
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, ["~> 2.5.19"])
    else
      s.add_dependency(%q<capistrano>, ["~> 2.5.19"])
    end
  else
    s.add_dependency(%q<capistrano>, ["~> 2.5.19"])
  end
end

