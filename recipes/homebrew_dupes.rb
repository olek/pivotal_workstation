include_recipe "pivotal_workstation::homebrew"

execute "include homebrew dupes repo" do
  command "brew tap homebrew/dupes"
  not_if { File.exists?("/usr/local/Library/Taps/homebrew-dupes") }
end
