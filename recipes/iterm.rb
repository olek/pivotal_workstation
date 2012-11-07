execute "Install iTerm" do
  version = '1_0_0_20120726'
  command(
    %Q(cd #{Chef::Config[:file_cache_path]}/ && \
        rm -fr iTerm && \
        mkdir iTerm && cd iTerm && \
        curl -L 'http://iterm2.googlecode.com/files/iTerm2-#{version}.zip' -O && \
        unzip -q iTerm2-#{version}.zip && \
        mv iTerm.app /Applications
        chown -R #{WS_USER} /Applications/iTerm.app
    ))
  not_if {File.exists?("/Applications/iTerm.app")}
end
