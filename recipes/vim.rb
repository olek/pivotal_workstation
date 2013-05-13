Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

# Acknowledgements: Some configuration source from
# https://github.com/Casecommons/casecommons_workstation

include_recipe "pivotal_workstation::homebrew"
include_recipe "pivotal_workstation::ack"
include_recipe "pivotal_workstation::git"
include_recipe "pivotal_workstation::rbenv"
include_recipe "pivotal_workstation::ctags"

%w(svim tvim).each do |script|
  template "/usr/local/bin/#{script}" do
    source "#{script}.erb"
    user WS_USER
    mode '0750'
  end
end

unless ( File.exists?("/usr/local/bin/mvim") and File.exists?("/Applications/MacVim.app") )
  execute "uninstall-vim" do
    command "brew uninstall vim"
    only_if "brew list | grep '^vim$'"
  end

  execute "brew-uninstall-macvim" do
    command "brew uninstall macvim"
    only_if "brew list | grep '^macvim$'"
  end

  execute "delete-macvim-application-link" do
    command "rm -rf /Applications/MacVim.app"
  end

  execute "Install MacVim" do
    version = 'MacVim-snapshot-64'
    command(
      %Q(cd #{Chef::Config[:file_cache_path]}/ && \
          rm -fr #{version} && \
          curl -L 'https://github.com/downloads/b4winckler/macvim/#{version}.tbz' | bzip2 -d | tar xf - && \
          cd #{version} && \
          mv MacVim.app /Applications && \
          mv mvim /usr/local/bin && \
          cd /usr/local/bin && \
          ln -nfs mvim vim && \
          ln -nfs mvim vi && \
          chown -R #{WS_USER} /Applications/MacVim.app
      ))
    not_if {File.exists?("/Applications/MacVim.app")}
  end

=begin
  execute "brew install macvim with system ruby" do
    user WS_USER
    # command "rbenv shell system; brew install macvim"
    # well, technically speaking right now we need to also edit brew recepe to
    # fix bug where no mvim windows will ever show up
    # brew edit macvim
    # and modify lines CC = nil to CC = 'clang'
    command "brew install macvim --override-system-vim"
    not_if "brew list | grep '^macvim$'"
  end

  # There may be multiple macvims; try to find the latest one
  # & link that to /Applications
  ruby_block "Link MacVim to /Applications" do
    block do
      macvim_app=Dir["/usr/local/Cellar/macvim/*/MacVim.app"].last
      raise "no macvim found" unless macvim_app
      if File.exists?(macvim_app)
        system("ln -fs #{macvim_app} /Applications/")
      end
    end
  end

=end
  ruby_block "test to see if MacVim link worked" do
    block do
      raise "/Applications/MacVim install failed" unless File.exists?("/Applications/MacVim.app")
    end
  end

  vim_home = node['vim_home']
  janus_home = "#{WS_HOME}/.janus"

  clean_configs = true

  if clean_configs
    [vim_home, janus_home].each do |dir|
      execute "remove pre existing #{dir}" do
        command "rm -rf #{dir}"
      end

      directory dir do
        user WS_USER
        mode '0750'
        action :create
      end
    end
  end

  # Execute the Janus bootstrap installation from github.
  execute "install janus for #{WS_USER}" do
    cmd = "curl -Lo- http://bit.ly/janus-bootstrap | bash"
    command %Q(sudo -H -u #{WS_USER} /bin/bash -c "#{cmd}")
    creates "#{vim_home}/bootstrap.sh"
  end

  %w(jgdavey/tslime.vim olek/vim-turbux).each do |repo|
    execute "clone #{repo} for #{WS_USER}" do
      cmd = "cd #{janus_home} && git clone http://github.com/#{repo}.git"
      command %Q(sudo -H -u #{WS_USER} /bin/bash -c "#{cmd}")
      creates "#{janus_home}/#{repo.split('/').last}"
    end
  end
end
