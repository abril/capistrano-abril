require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :bundle do

    desc "(bundler.rb) Install gems on the remote server using Bundler."
    task :install do

      run "mkdir -p #{shared_path}/bundle"
      # run <<-CMD
      #   echo "RAILS_ENV: $RAILS_ENV";
      #   if [ "$RAILS_ENV" == "production" ];
      #   then bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test ;
      #   else bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment ;
      #   fi;
      # CMD

      run <<-CMD
        echo "RAILS_ENV: $RAILS_ENV";
        [ "$RAILS_ENV" == "production" ] && bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test ;
      CMD
      run <<-CMD
        echo "RAILS_ENV: $RAILS_ENV";
        [ "$RAILS_ENV" != "production" ] && bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment ;
      CMD

    end
    after "deploy:update_code", "bundle:install"

  end # namespace

end

