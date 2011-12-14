set :app_name, 'bwi_store'
set :rvm_ruby, 'ruby-1.9.2-p290'
set :server_location, 'www.betterwayimports.com'

if ENV['RAILS_ENV'] == 'production'
  set :symlinks, ['config/initializers/airbrake.rb']
end

before 'deploy:finalize_update', 'spree:product_images'

namespace :spree do
  task :product_images do
    run "rm -rf #{release_path}/public/spree && ln -nfs #{shared_path}/spree #{release_path}/public/spree"
  end
end

require './config/boot'
if ENV['RAILS_ENV'] == 'production'
  require 'airbrake/capistrano'
end
require 'bz_labs/base'
require 'bz_labs/mysql'
require 'bz_labs/nginx'
require 'bz_labs/unicorn'

