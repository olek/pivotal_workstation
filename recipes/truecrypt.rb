pivotal_workstation_package "TrueCrypt 7.1a" do
  source "http://www.truecrypt.org/download/TrueCrypt%207.1a%20Mac%20OS%20X.dmg"
  action :install
  type "mpkg"
  package_id "org.TrueCryptFoundation.TrueCrypt"
  accept_eula true
end

