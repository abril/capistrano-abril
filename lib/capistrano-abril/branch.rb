require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoHelpers)

CapistranoHelpers.with_configuration do

  desc "Ensure that a branch has been selected."
  task :set_branch do
    if !exists?(:branch)
      set(:branch, ENV['TAG'] || ENV['BRANCH'] || \
      Capistrano::CLI.ui.ask('Type TAG or BRANCH name or SHA1 commit. (default: master)'))
    end
  end

  on :start, :set_branch

end

