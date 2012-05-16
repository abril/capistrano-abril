require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :bundle do

    desc "(bundler.rb) Install gems on the remote server using Bundler."
    task :install do

      run "mkdir -p #{shared_path}/bundle"
<<<<<<< HEAD
#


      if "#{rails_env}" != 'production'
#    if 1 != 0
          # dev/qa
          run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle "
      else
          # stage/prod
          run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --without development test"
=======
      
      env = fetch(:rails_env, fetch(:env, 'production'))
      
      if ['production', "stage"].include?(env)
        # stage/prod
        run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test"
      else
        # dev/qa
        run "bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment"
>>>>>>> d5601ae1eb19935018b29a0edea896b1d123c881
      end

    end
    after "deploy:update_code", "bundle:install"

  end # namespace

end
