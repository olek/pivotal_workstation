Chef::Log.warn 'Please use https://github.com/pivotal-sprout/sprout instead'

brew "imagemagick" do
  options '--disable-openmp'
end

imagemagick_prefix = `brew --prefix imagemagick`.chomp
imagemagick_lib_folder = "#{imagemagick_prefix}/lib"

%w(libMagick++ libMagickCore libMagickWand).each do |name|
  from_path = "#{imagemagick_lib_folder}/#{name}.dylib"
  to_path = "#{imagemagick_lib_folder}/#{name}-Q16.7.dylib"

  link from_path do
    to to_path
    owner WS_USER
  end
end
