include_recipe "pivotal_workstation::homebrew"
include_recipe "pivotal_workstation::git"

brew_install "tmux"
brew_install "reattach-to-user-namespace"
