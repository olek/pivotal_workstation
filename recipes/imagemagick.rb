include_recipe "pivotal_workstation::homebrew"

brew_install "imagemagick" do
  options '--disable-openmp'
end
