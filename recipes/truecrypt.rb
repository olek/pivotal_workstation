dmg_package "TrueCrypt 7.1a" do
  source "http://www.truecrypt.org/download/TrueCrypt%207.1a%20Mac%20OS%20X.dmg"
  action :install
  type "mpkg"
  package_id "org.TrueCryptFoundation.TrueCrypt"
  accept_eula true
end

template "/Users/#{WS_USER}/Library/LaunchAgents/truecrypt.plist" do
  source "truecrypt.plist.erb"
  user WS_USER
  mode '0640'
end
