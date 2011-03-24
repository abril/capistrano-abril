require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

# default_run_options[:pty] = true

    desc <<-DESC
      setup: create initial directories for all hosts.
      For a specific host:
        $ cap HOSTS=new.server.com deploy:setup
    DESC
    task :setup, :roles => :app, :except => { :no_release => true } do

        dirs =  [ "#{base_path}"          \
                , "#{logs_path}"          \
                , "#{deploy_to}"          \
                , "#{releases_path}"      \
                , "#{releases_path}/1"    \
                , "#{shared_path}"        \
                , "#{shared_path}/config" \
                , "#{config_path}"        \
                ]

        dirs.each do |d|
            puts "  * Creating [#{d}]"
#           run "#{sudo} umask #{umask} && mkdir -p #{d}", :pty => true
            run "#{sudo} mkdir -p                #{d}", :pty => true
            run "#{sudo} chmod g+w               #{d}", :pty => true
            run "#{sudo} chown #{user}:#{ugroup} #{d}", :pty => true
        end
        run "ln -nfs #{releases_path}/1 #{deploy_to}/current"
        puts " Dirs created."
    end

  end

end


