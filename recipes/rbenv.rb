Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

include_recipe "pivotal_workstation::git"
include_recipe "pivotal_workstation::gcc42"

::RBENV_HOME = "#{WS_HOME}/.rbenv"
::RBENV_COMMAND = "/usr/local/bin/rbenv"

brew "rbenv"
brew "ruby-build"

brew "rbenv-vars" 

pivotal_workstation_bash_it_enable_feature "plugins/rbenv"

node["rbenv"]["rubies"].each do |version, options|
  rbenv_ruby_install version do
    options options
  end
end

execute "making #{node["rbenv"]["default_ruby"]} with rbenv the default" do
  not_if { node["rbenv"]["default_ruby"].nil? }
  command "rbenv global #{node["rbenv"]["default_ruby"]}"
  user WS_USER
end
