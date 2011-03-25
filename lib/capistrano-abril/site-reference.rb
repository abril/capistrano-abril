require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc 'Make :structure_path as expected by Alexandria site-reference'
    task :do_site_reference do

      if !exists?(:structure_path)
        abort 'You must specify the correct destination using the "set :structure_path" command.'
      end

      run "mkdir -p #{structure_path} && chmod g+w #{structure_path}"
      run "rm -rf #{latest_release}/public/structure && ln -nsf  #{structure_path} #{latest_release}/public/structure"

    end

  end

  after "deploy:symlink", "deploy:do_site_reference"

end

