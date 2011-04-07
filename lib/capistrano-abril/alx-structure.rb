require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc '(site-reference.rb) Alexandria site-reference deploy.'
    task :structure do

      # pre-req: abril.rb
      deploy.setup_vars

      # checking....
      [ :structure_path, :structure_repos, :structure_branch ].each do |item|
        if !exists?( item )
          abort "You must specify 'set :#{item}' in deploy.rb. See README."
        end
      end

      # Custom branch/tag ?
      set :st_branch, ENV['TAG'] || ENV['BRANCH'] || :structure_branch || 'master'

      # structure clone
      run "[ -d #{structure_path} ] && /bin/rm -rf #{structure_path}"
      run "git clone --depth 1 #{structure_repos} #{structure_path} -b #{st_branch}"

      # symlink inside site-reference
      run "ln -nsf #{structure_path} #{latest_release}/structure"

    end

  end # namespace

end

#     run "mkdir -p #{structure_path} && chmod g+w #{structure_path}"
#     run "rm -rf #{latest_release}/structure && ln -nsf  #{structure_path}/current #{latest_release}/structure"

#     run "rm -rf #{latest_release}/structure && ln -nsf #{structure_path} #{latest_release}/structure"

