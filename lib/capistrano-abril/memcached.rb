require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :memcached do

    ### start/stop/restart
    [:start, :stop, :restart, :status].each do |t|
        desc "(memcached.rb) sudo /etc/init.d/memcached #{t}"
        task t, :roles => :memcache, :except => { :no_release => true } do
          run "#{sudo} /etc/init.d/memcached #{t}", :pty => true
        end
    end

  end # namespace

end

