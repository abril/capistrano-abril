require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoHelpers)

CapistranoHelpers.with_configuration do
 
  namespace :deploy do

    desc <<-DESC
      setup: create initial directories for all hosts.
      For a specific host:
        $ cap HOSTS=new.server.com deploy:setup
    DESC
    task :setup, :roles => :app, :except => { :no_release => true } do

        dirs =  [ "#{base_path}"          \
                , "#{deploy_to}"          \
                , "#{releases_path}"      \
                , "#{releases_path}/1"    \
                , "#{shared_path}"        \
                , "#{shared_path}/config" \
                , "#{logs_path}"          \
                , "#{config_path}"        \
                ]

        dirs.each |d| do
#         run "#{sudo} umask #{umask} && mkdir -p #{d}", :pty => true
#         run "#{sudo} chmod g+w                  #{d}", :pty => true
#         run "#{sudo} chown #{user}:#{ugroup}    #{d}", :pty => true
          run <<-CMD
              #{sudo}  " umask #{umask} && mkdir -p #{d} \
                      && chmod g+w                  #{d} \
                      && chown #{user}:#{ugroup}    #{d} "
          CMD
        end
        run "ln -nfs #{releases_path}/1 #{deploy_to}/current"
        puts " Dirs created."
    end

