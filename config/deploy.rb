$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

ssh_options[:username] = 'deployer'
ssh_options[:forward_agent] = true

set :nginx_conf_dir, "/etc/nginx/sites-enabled"
set :stages, %w(production staging)
set :application, 'bwi_store'
set :repository,  'git@github.com:BZLabs/bwi_store.git'
set :scm, :git
set :symlinks, %w(config/database.yml config/unicorn.rb)
set :rvm_ruby_string, '1.9.2-p290@bwi_store'
set :rvm_type, :user
set :keep_releases, 2
set :deploy_to, "/var/www/#{application}/#{rails_env}"

role :web, 'www.betterwayimports.com'
role :app, 'www.betterwayimports.com'
role :db, 'www.betterwayimports.com'

after 'deploy:finalize_update', 'deploy:symlink_shared'
after   'deploy:symlink_shared' , 'db:migrate'
after 'deploy:finalize_update', 'deploy:nginx:config'
after '  nginx:config'          , 'nginx:reload'
after 'deploy'                , 'deploy:cleanup'

namespace :deploy do
  %w(start stop restart).each do |action|
    task action do
      run "cd #{current_path} && RAILS_ENV=#{rails_env} script/unicorn #{action}"
    end
  end

  task :symlink_shared do
    run(symlinks.map do |link|
      "rm -rf #{release_path}/#{link} && ln -nfs #{shared_path}/#{link} #{release_path}/#{link}"
    end.join(' && '))
  end
end

namespace :db do
  task :migrate do
    run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  end
end

namespace :nginx do
  task :symlink_config do
    run "sudo rm -f #{nginx_config} && sudo ln -nfs #{release_path}/config/nginx_#{rails_env}.conf #{nginx_conf_dir}/#{rails_env}_#{application}"
  end

  task :reload do
    run "sudo /etc/init.d/nginx reload"
  end

  task :restart do
    run "sudo /etc/init.d/nginx restart"
  end
end

