require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :check do

    desc '(check-rails2.rb) Check Rails2 before symlink/startup.'
    task :rails2, :roles => :app, :except => { :no_release => true } do
      on_rollback { run "rm -rf #{latest_release}; true" }

      run "cd #{latest_release} && RAILS_ENV=#{rails_env} ./script/runner 'puts Rails.env'"

    end
    before "deploy:symlink", "check:rails2"

  end # namespace

end

