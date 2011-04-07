require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :redis do

    ### start/stop/restart
    [:start, :stop, :restart, :status].each do |t|
        desc "(redis.rb) sudo /etc/init.d/redis #{t}"
        task t, :roles => :app, :except => { :no_release => true } do
          run "#{sudo} /etc/init.d/redis #{t}", :pty => true
        end
    end

  end # namespace

end

