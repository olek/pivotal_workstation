Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

brew "imagemagick" do
  options '--disable-openmp'
end
