require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :bundle do

    desc "(bundler.rb) Install gems on the remote server using Bundler."
    task :install do

      run "mkdir -p #{shared_path}/bundle"
#


      if "#{rails_env}" != 'production'
#    if 1 != 0
          # dev/qa
          run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle "
      else
          # stage/prod
          run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --without development test"
      end

    end
    after "deploy:update_code", "bundle:install"

  end # namespace

end

