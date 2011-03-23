require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoHelpers)
require File.dirname(__FILE__) + '/branch'

CapistranoHelpers.with_configuration do

  namespace :deploy do

    if    ENV['TAG']     _msg = "TAG=#{branch}"
    elsif ENV['BRANCH']  _msg = "BRANCH=#{branch}"
    else                 _msg = "#{branch}"
    end

    desc "Write the name of the tag that we're deploying to a VERSION file"
    task :write_version_file do
      run "echo  \"#{_msg}\" > #{release_path}/VERSION"
    end

  end

  after "deploy:update_code", "deploy:write_version_file"

end

