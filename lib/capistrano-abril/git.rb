require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  # Git defaults
  set :scm             , :git
  set :scm_user        , "#{user}"
  set :scm_verbose     , true

  # Faster: keep local repos and fetch only the differences
  set :deploy_via      , :remote_cache
  set :copy_exclude    , [".svn", "*~", ".DS_Store"]

end

