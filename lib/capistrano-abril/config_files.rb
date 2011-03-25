require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc '[internal] Replace named files with a symlink to their counterparts in shared/'
    task :do_config_files do

      if !exists?(:config_files)
        abort 'You must specify which files to symlink using the "set :config_files" command.'
      end

      config_files.each do |files,destination|

        raise "Destination path is nil!" if destination.nil?
        run <<-CMD
          for f in  `/bin/ls -1 #{shared_path}/config/#{files}` ; \
          do ln -snf ${f}  #{latest_release}/#{destination}/${f##*/} ; done
        CMD

      end

    end

  end

  after "deploy:symlink", "deploy:do_config_files"

end

