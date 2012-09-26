include_recipe "pivotal_workstation::git"
pivotal_workstation_bash_profile_include "git_vim"

template "#{WS_HOME}/.gitignore_global" do
  source "gitignore_global.erb"
  owner WS_USER
  variables(
    :ignore_idea => node[:git_global_ignore_idea]
  )
end

git_configs = {
  'core.excludesfile' =>
    "#{WS_HOME}/.gitignore_global",
  'alias.st' =>
    'status',
  'alias.di' =>
    'diff',
  'alias.co' =>
    'checkout',
  'alias.ci' =>
    'commit',
  'alias.br' =>
    'branch',
  'alias.sta' =>
    'stash',
  'apply.whitespace' =>
    'nowarn',
  'color.branch' =>
    'auto',
  'color.diff' =>
    'auto',
  'color.interactive' =>
    'auto',
  'color.status' =>
    'auto',
  'color.ui' =>
    'auto',
  'branch.autosetupmerge' =>
    'true'
}

git_configs.each do |k, v|
  execute "set global git config #{k}" do
    command "git config --global #{k} #{v}"
    user WS_USER
    not_if "git config --global #{k} | grep -q #{v}"
  end
end

execute "set alias llog=log --date=local" do
  command "git config --replace-all --global alias.llog 'log --date=local'"
  user WS_USER
end
