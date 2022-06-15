# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

desc "Add Proxy"
task :proxy do
  on roles(:all) do
    excute "export http_proxy=127.0.0.1:7890;export https_proxy=127.0.0.1:7890;export all_proxy=127.0.0.1:7890 && curl ipinfo.io"
  end
end

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/scm/git-with-submodules"
install_plugin Capistrano::SCM::Git::WithSubmodules

desc "Remove Proxy"
task :unproxy do
  on roles(:all) do
    excute "unset http_proxy;unset https_proxy;unset all_proxy && curl ipinfo.io"
  end
end
# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
require "capistrano/rvm"
# require "capistrano/rbenv"
# require "capistrano/chruby"
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
# require "capistrano/passenger"
require 'capistrano/puma'
install_plugin Capistrano::Puma, load_hooks: false
install_plugin Capistrano::Puma::Systemd

require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit'
install_plugin Capistrano::Puma::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
