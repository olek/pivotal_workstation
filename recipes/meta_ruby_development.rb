include_recipe "pivotal_workstation::rbenv"
include_recipe "pivotal_workstation::bash_profile-no_sudo_gem_install"
include_recipe "pivotal_workstation::mysql"
include_recipe "pivotal_workstation::postgres"
include_recipe "pivotal_workstation::rubymine"
include_recipe "pivotal_workstation::rubymine_preferences_pivotal"
include_recipe "pivotal_workstation::imagemagick"
include_recipe "pivotal_workstation::gem_no_rdoc_no_ri"
#include_recipe "pivotal_workstation::node_js"
include_recipe "pivotal_workstation::qt"
