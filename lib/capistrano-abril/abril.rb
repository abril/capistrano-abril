require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  def _mytime
    Time.now.utc.strftime("%Y-%m-%d-%H%M")
  end

  # Abril defaults
  set :release_name  , _mytime()
  set :ugroup        , fetch(:ugroup , "infra" )
  set :umask         , fetch(:umask  , "002"   )

# set :group_writable, fetch(:group_writable, true )

  set :keep_releases , fetch(:keep_releases, 5    )
  set :use_sudo      , fetch(:use_sudo     , false)

  set :base_path     , "/abd"
  set :app_path      , "#{base_path}/app"
  set :logs_path     , "#{base_path}/logs/#{application}"

  set :deploy_to     , "#{app_path}/#{application}"
  set :current_path  , "#{deploy_to}/current"
  set :releases_path , "#{deploy_to}/releases"
  set :shared_path   , "#{deploy_to}"
  set :config_path   , "#{deploy_to}/config"
  set :bundle_path   , "#{deploy_to}/bundle"

  set :default_shell , "/bin/bash"


# set :base_path     , fetch(:base_path    , "/abd"                     )
# set :app_path      , fetch(:app_path     ,"#{base_path}/app"          )
# set :logs_path     , fetch(:logs_path    ,"#{base_path}/logs/#{application}")

# set :deploy_to     , fetch(:deploy_to    ,"#{app_path}/#{application}")
# set :current_path  , fetch(:current_path ,"#{deploy_to}/current"      )
# set :releases_path , fetch(:releases_path,"#{deploy_to}/releases"     )
# set :shared_path   , fetch(:shared_path  ,"#{deploy_to}"              )
# set :config_path   , fetch(:config_path  ,"#{deploy_to}/config"       )
# set :bundle_path   , fetch(:bundle_path  ,"#{deploy_to}/bundle"       )


  namespace :deploy do

    desc "Cleaning up unused dirs."
    task :cleanup_shared do
        run "/bin/rm -rf #{shared_path}/{log,pids,system}"
        run "ln -nsf #{logs_path} #{latest_release}/log      "
        run "ln -nsf #{logs_path} #{latest_release}/tmp/pids "
      end

    after  "deploy:finalize_update" , "deploy:cleanup_shared"

    desc "OVR"
    task :start do
    end

    desc "OVR"
    task :stop do
    end

    desc "OVR"
    task :restart do
    end

  end


end
