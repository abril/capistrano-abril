require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do
  
  # Always run migrations.
  after "deploy:update_code", "deploy:migrate"

end
