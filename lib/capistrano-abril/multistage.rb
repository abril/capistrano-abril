require File.dirname(__FILE__) + '/../capistrano-abril' if ! defined?(CapistranoAbril)

require 'fileutils'

CapistranoAbril.with_configuration do

### Shameless copy from Jamis capistrano/ext,
### and correcting :stage -> :mstage so I can use
###
###      cap stage deploy
###

  Capistrano::Configuration.instance.load do
    location = fetch(:stage_dir, "config/deploy")

    unless exists?(:stages)
      set :stages, Dir["#{location}/*.rb"].map { |f| File.basename(f, ".rb") }
    end

    stages.each do |name|
      desc "(multistage.rb) cap #{name} deploy ..."
      task(name) do
        set :mstage, name.to_sym
        load "#{location}/#{mstage}"
      end
    end

    on :load do
      if stages.include?(ARGV.first)
        # Execute the specified stage so that recipes required in stage can contribute to task list
        find_and_execute_task(ARGV.first) if ARGV.any?{ |option| option =~ /-T|--tasks|-e|--explain/ }
      else
        # Execute the default stage so that recipes required in stage can contribute tasks
        find_and_execute_task(default_stage) if exists?(:default_stage)
      end
    end

    namespace :multistage do # {

      desc "(multistage.rb) [internal] Ensure that a stage has been selected."
      task :ensure do
        if !exists?(:mstage)
          if exists?(:default_stage)
            logger.important "Defaulting to '#{default_stage}'"
            find_and_execute_task(default_stage)
          else
            abort "No stage specified. Please specify one of: #{stages.join(', ')} (e.g. 'cap #{stages.first} #{ARGV.last}')"
          end
        end
      end

      desc "(multistage.rb) Stub out the staging config files."
      task :prepare do
        FileUtils.mkdir_p(location)
        stages.each do |name|
          file = File.join(location, name + ".rb")
          unless File.exists?(file)
            File.open(file, "w") do |f|
              f.puts "# #{name.upcase}-specific deployment configuration"
              f.puts "# please put general deployment config in config/deploy.rb"
            end
          end
        end
      end

    end # namespace
    on :start, "multistage:ensure", :except => stages + ['multistage:prepare']
    # }

  end # Capistrano::Configuration

end

