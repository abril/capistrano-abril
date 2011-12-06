require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

CapistranoAbril.with_configuration do

  namespace :deploy do

    desc '(alx-structure.rb) Alexandria site-reference deploy.'
    task :structure do

      # checking....
      [ :structure_path, :structure_repos, :structure_branch ].each do |item|
        if !exists?( item )
          abort "You must specify 'set :#{item}' in deploy.rb. See README."
        end
      end

      # Custom branch/tag ?
      set :st_branch, ENV['TAG'] || ENV['BRANCH'] || structure_branch || 'master'

      # structure clone
      # symlink inside site-reference
      run <<-CMD
        # DO NOT DO RESET HARD ANYMORE YOU BASTARD.. all the headlines go away!
        #if [ ! -d #{structure_path}/.git ] ;
        #then echo "Cloning structure:"   &&
        #     git clone --depth 1 #{structure_repos} #{structure_path} &&
        #     cd #{structure_path} && git checkout -b #{st_branch} -t origin/#{st_branch};
        #else echo "Resetting structure:" &&
        #     cd #{structure_path} && git reset --hard && git clean -d -x -f;
        #fi ;
        ln -nsf #{structure_path} #{latest_release}/structure
      CMD

    end
    after "deploy:symlink" , "deploy:structure"

  end # namespace

end

