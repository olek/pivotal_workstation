include_recipe "pivotal_workstation::redis"

pivotal_workstation_bash_profile_include "modcloth"

%w(vimrc.before vimrc.after gvimrc.after irbrc).each do |name|
  template "#{WS_HOME}/.#{name}" do
    source "#{name}.erb"
    mode '0640'
    owner WS_USER
  end
end
