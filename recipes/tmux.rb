Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

include_recipe "pivotal_workstation::git"

brew "tmux"
brew "reattach-to-user-namespace"
