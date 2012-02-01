# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "capistrano-abril"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcus Vinicius Ferreira"]
  s.date = "2012-02-01"
  s.description = "Defaults and recipes used in our deployments. Based on 'capistrano-helpers' gem."
  s.email = "ferreira.mv@gmail.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "1.txt",
    "CHANGELOG.markdown",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "capistrano-abril.gemspec",
    "lib/capistrano-abril.rb",
    "lib/capistrano-abril/abril.rb",
    "lib/capistrano-abril/alx-structure.rb",
    "lib/capistrano-abril/b.rb",
    "lib/capistrano-abril/branch.rb",
    "lib/capistrano-abril/bundler.rb",
    "lib/capistrano-abril/check_rails2.rb",
    "lib/capistrano-abril/check_rails3.rb",
    "lib/capistrano-abril/config_files.rb",
    "lib/capistrano-abril/gems.rb",
    "lib/capistrano-abril/git.rb",
    "lib/capistrano-abril/memcached.rb",
    "lib/capistrano-abril/multistage.rb",
    "lib/capistrano-abril/passenger.rb",
    "lib/capistrano-abril/php.rb",
    "lib/capistrano-abril/redis.rb",
    "lib/capistrano-abril/setup.rb",
    "lib/capistrano-abril/site-reference.rb",
    "lib/capistrano-abril/site-structure.rb",
    "lib/capistrano-abril/specs.rb",
    "lib/capistrano-abril/symlinks.rb",
    "lib/capistrano-abril/version.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "http://github.com/abril/capistrano-abril"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Defaults and recipes used in our deployments."

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

