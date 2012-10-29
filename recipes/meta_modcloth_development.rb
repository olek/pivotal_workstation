include_recipe "pivotal_workstation::redis"
include_recipe "pivotal_workstation::sequel_pro"
include_recipe "pivotal_workstation::menubar_preferences"
include_recipe "pivotal_workstation::truecrypt"
include_recipe "pivotal_workstation::freetds"
include_recipe "pivotal_workstation::diffmerge"
include_recipe "pivotal_workstation::growl"
include_recipe "pivotal_workstation::system_preferences"
include_recipe "pivotal_workstation::iterm"

pivotal_workstation_bash_profile_include "modcloth"

%w(vimrc.before vimrc.after gvimrc.after irbrc tmux.conf screenrc).each do |name|
  template "#{WS_HOME}/.#{name}" do
    source "#{name}.erb"
    mode '0640'
    owner WS_USER
  end
end
