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

  end

end

