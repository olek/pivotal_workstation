dmg_package "Growl" do
  source "http://cdn.bitbucket.org/pmetzger/growl/downloads/Growl-1.2.2f1.dmg"
  action :install
  type "pkg"
  volumes_dir "Growl-1.2.2f1"
  package_id "com.growl.growl.pkg"
end

pivotal_workstation_defaults "Growl: show in menu"   do
  domain 'com.Growl.GrowlHelperApp'
  key 'GrowlMenuExtra'
  integer 1
end

pivotal_workstation_defaults "Growl enabled"   do
  domain 'com.Growl.GrowlHelperApp'
  key 'GrowlEnabled'
  integer 1
end

pivotal_workstation_defaults "Growl: no updates, please"   do
  domain 'com.Growl.GrowlHelperApp'
  key 'GrowlUpdateCheck'
  integer 0
end

pivotal_workstation_defaults "Growl displays as smoke"   do
  domain 'com.Growl.GrowlHelperApp'
  key 'GrowlDisplayPluginName'
  string 'smoke'
end

