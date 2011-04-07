require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :bundle do

    desc "(bundler.rb) Install gems on the remote server using Bundler."
    task :install do

      run "mkdir -p #{shared_path}/bundle"

      if ENV['RAILS_ENV'] == 'production'
          run <<-CMD
            bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment --without development test
          CMD
      else
          run <<-CMD
            bundle install --gemfile #{latest_release}/Gemfile --path #{shared_path}/bundle --deployment
          CMD
      end

    end
    after "deploy:update_code", "bundle:install"

  end # namespace

end

