readline_prefix = `brew --prefix readline`.chomp

readline_env_new = readline_env_old = {}
if readline_prefix =~ /opt/
  readline_env_old = {
    'CONFIGURE_OPTS' => %Q(-c --enable-shared -c --with-readline-dir=#{readline_prefix})
  }
  readline_env_new = {
    'CONFIGURE_OPTS' => %Q(--enable-shared --with-readline-dir=#{readline_prefix}),
    'CC' => 'clang'
  }
end

unless node["rbenv"]
  node.default["rbenv"]= {
    "rubies" => {
        "ree-1.8.7-2011.03" => { :env => readline_env_old },
        "1.9.3-p194" => { :env => readline_env_new }
      },
    "default_ruby" => "1.9.3-p194"
  }
end
