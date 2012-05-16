require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  def _mytime
    Time.now.strftime("%Y-%m-%d-%H%M")
  end

  namespace :deploy do

    ### setup_vars
    desc "(abril.rb) [internal] Setting up vars"
    task :setup_vars, :roles => :app, :except => { :no_release =>  true } do

        # Abril defaults
        set :release_name  , _mytime()
        set :ugroup        , "infra"
        set :umask         , "002"

        set :keep_releases , 5
        set :use_sudo      , false

        set :base_path     , "/abd"
        set :app_path      , "#{base_path}/app"
        set :logs_path     , "#{base_path}/logs/#{application}"

        set :deploy_to     , "#{app_path}/#{application}"
        set :current_path  , "#{deploy_to}/current"
        set :releases_path , "#{deploy_to}/releases"
        set :shared_path   , "#{deploy_to}"
        set :config_path   , "#{deploy_to}/config"
        set :bundle_path   , "#{deploy_to}/bundle"
        set :structure_path, "#{deploy_to}/structure"

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

    end
    before  "deploy:update" , "deploy:setup_vars"
    before  "deploy:migrate", "deploy:setup_vars"

    ### show_vars
    desc "(abril.rb) show_vars: Show custom variables defined by abril.rb."
    task :show_vars , :roles => :app, :except => { :no_release =>  true } do

        deploy.setup_vars

        puts "-" * 70
        puts "abril.rb:show_vars - using current values:"
        puts ""
        puts "              port: #{port}"
        puts "             umask: #{umask}"
        puts "              user: #{user}"
        puts "       application: #{application}"
        puts "        repository: #{repository}"
        puts "  repository_cache: #{repository_cache}"
        puts ""
        puts "         base_path: #{base_path}"
        puts "          app_path: #{app_path}"
        puts "       deploy_path: #{deploy_to}"
        puts "      current_path: #{current_path}"
        puts "     releases_path: #{releases_path}"
        puts "       shared_path: #{shared_path}"
        puts "       config_path: #{config_path}"
        puts "    structure_path: #{structure_path}"
        puts "         logs_path: #{logs_path}"
        puts "-" * 70
        puts ""

    end

    ### deploy:start/stop/restart
    [:start, :stop, :restart, :status].each do |t|
        desc "(abril.rb) sudo apachectl #{t}"
        task t, :roles => :app, :except => { :no_release => true } do
          run "#{sudo} apachectl #{t}", :pty => true
        end
    end

    ### cleanup_shared
    desc "(abril.rb) [internal] Clean up unused dirs."
    task :cleanup_shared, :roles => :app, :except => { :no_release => true } do
        run "/bin/rm -rf #{shared_path}/{log,pids,system} #{latest_release}/public/system"
        run "ln -nsf #{logs_path} #{latest_release}/log      "
        run "ln -nsf #{logs_path} #{latest_release}/tmp/pids "
    end
    after  "deploy:finalize_update" , "deploy:cleanup_shared"

    ### cleanup releases_path
    after  "deploy:finalize_update" , "deploy:cleanup"

    ###

  end # namespace

end # CapistranoAbril

