include_recipe "pivotal_workstation::homebrew"

execute "install freetds" do
  user WS_USER
  command "brew install freetds"
  not_if "brew list | grep '^freetds$'"
end

