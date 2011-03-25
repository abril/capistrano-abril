require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc "[internal] Ensure that a branch has been selected."
    task :set_branch do
      if !exists?(:branch)

        set :branch, ENV['TAG'] || ENV['BRANCH'] || \
        Capistrano::CLI.ui.ask('Type TAG or BRANCH or SHA1 commit. (default: master)')

      end

    end

    before  "deploy:update" , "deploy:set_branch"
  end

end

