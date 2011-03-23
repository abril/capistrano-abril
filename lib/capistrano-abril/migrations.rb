require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoHelpers)

CapistranoHelpers.with_configuration do
  
  # Always run migrations.
  after "deploy:update_code", "deploy:migrate"

end
