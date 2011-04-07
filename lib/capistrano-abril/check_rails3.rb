require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :check do

    desc '(check-rails3.rb) Check Rails3 before symlink/startup.'
    task :rails3, :roles => :app, :except => { :no_release => true } do
      on_rollback { run "rm -rf #{latest_release}; true" }

      run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rails runner 'puts Rails.env'"

    end
    before "deploy:symlink", "check:rails3"

  end # namespace

end


