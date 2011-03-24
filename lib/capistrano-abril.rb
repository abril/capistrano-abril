require 'capistrano'

unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano-abril requires Capistrano 2"
end

class CapistranoAbril
  
  # Execute the given block of code within the context of the capistrano
  # configuration.
  def self.with_configuration(&block)
    Capistrano::Configuration.instance(:must_exist).load(&block)
  end
  
end
