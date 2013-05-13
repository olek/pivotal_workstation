=begin
readline_prefix = `brew --prefix readline`.chomp

readline_option_new = readline_option_old = ''
if readline_prefix =~ /Cellar/
  readline_option_new = %Q(CONFIGURE_OPTS="--enable-shared --with-readline-dir=#{readline_prefix}")
  readline_option_old = %Q(CONFIGURE_OPTS="-c --enable-shared -c --with-readline-dir=#{readline_prefix}")
end

node.default["rbenv"]= {
  "rubies" => {
      "ree-1.8.7-2011.03" => { :env => readline_option_old },
      "1.9.3-p194" => { :env => readline_option_new }
    },
  "default_ruby" => "1.9.3-p194"
}
=end

unless node["rbenv"]
  node.default["rbenv"]= {
    "rubies" => {
        "ree-1.8.7-2011.03" => {},
        "1.9.3-p194" => { :env => {"CC" => "clang"}}
      },
    "default_ruby" => "1.9.3-p194"
  }
end
