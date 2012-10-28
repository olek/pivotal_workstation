pivotal_workstation_defaults "No natural scrolling, please"   do
  domain 'NSGlobalDomain'
  key 'com.apple.swipescrolldirection'
  boolean false
end

pivotal_workstation_defaults "Permanent scroll bars"   do
  domain 'NSGlobalDomain'
  key 'AppleShowScrollBars'
  string 'Always'
end

pivotal_workstation_defaults "Keyboard access to all controlls"   do
  domain 'NSGlobalDomain'
  key 'AppleKeyboardUIMode'
  integer 3
end

pivotal_workstation_defaults "Menu bar transparency"   do
  domain 'NSGlobalDomain'
  key 'AppleEnableMenuBarTransparency'
  boolean false
end

pivotal_workstation_defaults "Subpixel rendering on non-Apple LCDs"   do
  domain 'NSGlobalDomain'
  key 'AppleFontSmoothing'
  integer 2
end

pivotal_workstation_defaults "Show all extensions"   do
  domain 'NSGlobalDomain'
  key 'AppleShowAllExtensions'
  boolean true
end

pivotal_workstation_defaults "Safari debug menu"   do
  domain 'com.apple.Safari'
  key 'IncludeDebugMenu'
  boolean true
end

pivotal_workstation_defaults "2D Dock"   do
  domain 'com.apple.dock'
  key 'no-glass'
  boolean true
end

pivotal_workstation_defaults "Auto-hide Dock"   do
  domain 'com.apple.dock'
  key 'autohide'
  boolean true
end

pivotal_workstation_defaults "No DS_Store on network volumes"   do
  domain 'com.apple.desktopservices'
  key 'DSDontWriteNetworkStores'
  boolean true
end

pivotal_workstation_defaults "No reopening windows on login"   do
  domain 'com.apple.loginwindow'
  key 'TALLogoutSavesState'
  boolean false
end

pivotal_workstation_defaults "Terminal: disable resume"   do
  domain 'com.apple.Terminal'
  key 'NSQuitAlwaysKeepsWindows'
  boolean false
end
