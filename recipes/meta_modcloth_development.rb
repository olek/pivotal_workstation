include_recipe "pivotal_workstation::redis"
include_recipe "pivotal_workstation::menubar_preferences"
include_recipe "pivotal_workstation::truecrypt"

pivotal_workstation_bash_profile_include "modcloth"

%w(vimrc.before vimrc.after gvimrc.after irbrc tmux.conf screenrc).each do |name|
  template "#{WS_HOME}/.#{name}" do
    source "#{name}.erb"
    mode '0640'
    owner WS_USER
  end
end
