require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)
require File.dirname(__FILE__) + '/check'

CapistranoAbril.with_configuration do

  before "deploy:symlink", "check:rails3"

end
