require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do
 
  namespace :deploy do
    desc 'Restart passenger'
    task :restart, :roles => :app do
      run "touch #{current_path}/tmp/restart.txt"
    end
  end

end