require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do
  
  namespace :gems do
    desc "Install gems on the remote server."
    task :install, :roles => :app do
      rails_env = fetch(:rails_env, "production")
      run "cd #{current_release} && #{sudo} rake gems:install RAILS_ENV=#{rails_env}"
    end
  end
  
  after "deploy:update_code", "gems:install"

end
