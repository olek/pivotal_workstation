include_recipe "pivotal_workstation::redis"
include_recipe "pivotal_workstation::sequel_pro"
include_recipe "pivotal_workstation::menubar_preferences"
include_recipe "pivotal_workstation::truecrypt"
include_recipe "pivotal_workstation::freetds"
include_recipe "pivotal_workstation::diffmerge"
include_recipe "pivotal_workstation::growl"
include_recipe "pivotal_workstation::system_preferences"
include_recipe "pivotal_workstation::iterm"
include_recipe "pivotal_workstation::sizeup"

# TODO find ways to reenable
#pivotal_workstation_bash_profile_include "modcloth"
#pivotal_workstation_bash_it_enable_feature "modcloth"

%w(vimrc.before vimrc.after gvimrc.after irbrc tmux.conf screenrc).each do |name|
  template "#{WS_HOME}/.#{name}" do
    source "#{name}.erb"
    mode '0640'
    owner WS_USER
  end
end
