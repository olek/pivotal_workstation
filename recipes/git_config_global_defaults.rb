Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

include_recipe "pivotal_workstation::git"
pivotal_workstation_bash_it_custom_plugin "git-export_editor.bash"

template "#{WS_HOME}/.gitignore" do
  source "gitignore_global.erb"
  owner WS_USER
  variables(:ignore_idea => node[:git_global_ignore_idea])
end

git_configs = {
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
  "alias.ll" => "log --pretty=format:\"%Cred%h %Cblue%an %Cgreen%s / %Cblue%ar%Creset\" --abbrev-commit -n15",
  "alias.st" => "status",
  "alias.s" => "status --short",
  "alias.w" => "whatchanged",
  "alias.pull-ff" => "pull --ff-only",
  "alias.edit-unmerged" => "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; tvim `f`",
  "alias.add-unmerged" => "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`",
  "alias.down" => "!sh -c \"CURRENT=$(git symbolic-ref HEAD | sed -e s@.*/@@) && (git pull --ff-only || (git fetch origin && git rebase --preserve-merges origin/$CURRENT))\"",
  "alias.publish" => "!f() { if [ $# -ne 1 ]; then echo \"usage: git publish <local-branch-name>\" >&2; exit 1; fi; git push --set-upstream origin $1:$1; }; f",
  "alias.unpublish" => "!f() { if [ $# -ne 1 ]; then echo \"usage: git unpublish <remote-branch-name>\" >&2; exit 1; fi; git push origin :$1; }; f",

  "color.branch" => "auto",
  "color.diff" => "auto",
  "color.interactive" => "auto",
  "color.status" => "auto",
  "color.ui" => "true",
  "color.grep" => "auto",

  "core.excludesfile" => "~/.gitignore",

  "branch.autosetuprebase" => "never",
  "branch.autosetupmerge" => "true",

  "apply.whitespace" => "fix",
  "grep.lineNumber " => "true",
  "pull.rebase" => "true",
  "push.default" => "current",

  "diff.tool" => "diffmerge",
  "difftool.diffmerge.cmd" => "diffmerge \"$LOCAL\" \"$REMOTE\"",
  "merge.tool" => "diffmerge",
  "mergetool.diffmerge.cmd" => "diffmerge --merge --result=\"$MERGED\" \"$LOCAL\" \"$(if test -f \"$BASE\"; then echo \"$BASE\"; else echo \"$LOCAL\"; fi)\" \"$REMOTE\"",
  "mergetool.diffmerge.trustExitCode" => "true",
  "mergetool.keepBackup" => "false"
}

git_configs.each do |k, v|
  execute "set global git config #{k}" do
    command "git config --global #{k} \'#{v}\'"
    user WS_USER
    not_if "git config --global #{k} | grep -q \'#{v}\'"
  end
end

execute "set rebase autosquash=true" do
  command "git config --global rebase.autosquash true"
  user WS_USER
end
