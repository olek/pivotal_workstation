include_recipe "pivotal_workstation::homebrew"

execute "install ctags" do
  user WS_USER
  command "brew install ctags"
  not_if "brew list | grep '^ctags$'"
end

