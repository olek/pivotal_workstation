unless File.exists?("/usr/local/bin/diffmerge") && File.exists?("/Applications/DiffMerge.app")
  execute "delete DiffMerge.app" do
    command "rm -rf /Applications/DiffMerge.app"
  end

  execute "delete diffmerge" do
    command "rm -f /usr/local/bin/diffmerge"
  end

  dmg_package "DiffMerge" do
    ref = "DiffMerge.3.3.2.1139"
    volumes_dir ref.sub('.', ' ')
    source "http://download-us.sourcegear.com/DiffMerge/3.3.2/#{ref}.dmg"
    action :install
  end

  template "/usr/local/bin/diffmerge" do
    source "diffmerge.erb"
    user WS_USER
    mode '0750'
  end
end
