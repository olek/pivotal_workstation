include_recipe "pivotal_workstation::git"
pivotal_workstation_bash_profile_include "git_vim"

template "#{WS_HOME}/.gitignore" do
  source "gitignore_global.erb"
  owner WS_USER
  variables(
    :ignore_idea => node[:git_global_ignore_idea]
  )
end

git_configs = {
  "alias.bf" => "branch-for-story",
  "alias.br" => "branch",
  "alias.bra" => "branch -a",
  "alias.ci" => "commit",
  "alias.co" => "checkout",
  "alias.cp" => "cherry-pick",
  "alias.dc" => "diff --cached",
  "alias.di" => "diff",
  "alias.g" => "log --pretty=format:\"%h %an - %s\" --graph",
  "alias.gg" => "log --pretty=format:\"%H %an - %s\" --graph",
  "alias.lc" => "log ORIG_HEAD.. --stat --no-merges",
  "alias.lg" => "log --oneline",
  "alias.ll" => "log --pretty=format:\"%Cred%h %Cblue%an %Cgreen%s / %Cblue%ar%Creset\" --abbrev-commit -n15",
  "alias.pr" => "pull --rebase",
  "alias.st" => "status",
  "alias.s" => "status --short",
  "alias.w" => "whatchanged",
  "alias.pull-ff" => "pull --ff-only",
  "alias.edit-unmerged" => "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; gvim `f`",
  "alias.add-unmerged" => "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`",
  "alias.down" => "!sh -c \"CURRENT=$(git symbolic-ref HEAD | sed -e s@.*/@@) && (git pull --ff-only || (git fetch origin && git rebase --preserve-merges origin/$CURRENT))\"",
  "alias.publish" => "!f() { if [ $# -ne 1 ]; then echo \"usage: git publish <local-branch-name>\" >&2; exit 1; fi; git push --set-upstream origin $1:$1; }; f",
  "alias.unpublish" => "!f() { if [ $# -ne 1 ]; then echo \"usage: git unpublish <remote-branch-name>\" >&2; exit 1; fi; git push origin :$1; }; f",

  "color.branch" => "auto",
  "color.diff" => "auto",
  "color.interactive" => "auto",
  "color.status" => "auto",
  "color.ui" => "true",

  "core.excludesfile" => "~/.gitignore",

  "autosetup.rebase" => "true",
  "autosetup.autosetuprebase" => "remote",
  "autosetup.autosetupmerge" => "true",
  "autosetup.mergeoptions" => "--no-commit --no-ff",

  "push.default" => "current",
}

git_configs.each do |k, v|
  execute "set global git config #{k}" do
    command "git config --global #{k} \'#{v}\'"
    user WS_USER
    not_if "git config --global #{k} | grep -q \'#{v}\'"
  end
end
