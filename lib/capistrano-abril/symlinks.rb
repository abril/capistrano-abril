require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc '(symlinks.rb) [internal] Replace named files with a symlink to their counterparts in shared/'
    task :do_symlinks do

      if !exists?(:symlinks)
        abort 'You must specify "set :symlinks" command. See README.'
      end

      symlinks.each do |path,destination|

        raise "Release path is nil!"     if release_path.nil? || release_path.empty?
        raise "Path is nil!"             if path.nil?         || path.empty?
        raise "Destination path is nil!" if destination.nil?

        run "rm -rf #{release_path}/#{destination} && ln -nsf #{path} #{release_path}/#{destination}"

      end

    end
    after "deploy:symlink", "deploy:do_symlinks"

  end # namespace

end

