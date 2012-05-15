require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)
require File.dirname(__FILE__) + '/check'

CapistranoAbril.with_configuration do

  after "deploy:structure", "check:rails3"

end
