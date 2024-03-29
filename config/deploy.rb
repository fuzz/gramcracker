# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.13.0'

append :linked_files, 'config/master.key'

set :application, 'gramcracker'
set :branch, 'master'
set :bundle_binstubs, nil
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }
set :deploy_to, '/usr/local/www/gramcracker'
set :linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
                   'vendor/bundle', 'public/system']
set :pty,  false
set :repo_url, 'git@github.com:fuzz/gramcracker.git'

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"

# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets",
# "vendor/bundle", ".bundle", "public/system", "public/uploads"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log",
# color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/master.key"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets",
# "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV["USER"]
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before
# first deploy.
# set :ssh_options, verify_host_key: :secure
