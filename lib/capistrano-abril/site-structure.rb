require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc '[internal] Set tree at :structure_path as expected by Alexandria site-structure'
    task :do_site_structure do

      set :deploy_to     , "#{app_path}/#{application}/structure"
      set :current_path  , "#{deploy_to}/current"
      set :releases_path , "#{deploy_to}/releases"
      set :shared_path   , "#{deploy_to}"
      set :config_path   , "#{deploy_to}/config"
      set :bundle_path   , "#{deploy_to}/bundle"

    end

    before "deploy:update", "deploy:do_site_structure"
    before "deploy:setup" , "deploy:do_site_structure"

    desc "[internal] Clean up unused dirs."
    task :cleanup_structure do
        run "/bin/rm -rf #{shared_path}/{log,pids,system} #{latest_release}/public/system"
        run "/bin/rm -rf #{latest_release}/{log,/tmp/pids}"

        # qbg
        run "/bin/cp -rp #{deploy_to}/#{repository_cache}/.git #{latest_release}/"

      end

    after  "deploy:finalize_update" , "deploy:cleanup_structure"

  end

end

