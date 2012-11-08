#!/bin/bash

# Preconditions: (IMPORTANT)
#
# install command lines tools from xcode (note - xcode itself is NOT required).
# if only cmd line tools are installed (no xcode monstrosity) following hack must be applied:
#   sudo -H -i
#   xtools-select --switch /usr/bin && mv /usr/bin/xcrun /usr/bin/xcrun.orig && echo -e '#!/bin/sh\n$@' > /usr/bin/xcrun && chmod a+x /usr/bin/xcrun
# it may be a good time to rename machine now to a better name from its initial cryptic or silly name:
#   sudo scutil –-set HostName new_hostname


set -e
pushd `pwd`
time sudo gem install soloist --no-rdoc --no-ri

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::meta_osx_base
- pivotal_workstation::meta_osx_development
- pivotal_workstation::meta_ruby_development
- pivotal_workstation::meta_modcloth_development
EOF
if [[ -d pivotal_workstation ]]; then
  cd dmg && git pull --ff-only && cd ..
  cd pivotal_workstation && git reset HEAD~33 --hard && git pull --ff-only && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
  git clone https://github.com/olek/pivotal_workstation.git
  cd pivotal_workstation && git checkout mlion && cd ..
fi
time soloist
popd
