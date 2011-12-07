set :app_name, 'bwi_store'
set :rvm_ruby, 'ruby-1.9.2-p290'
set :server_location, 'www.betterwayimports.com'

before 'deploy:finalize_update', 'spree:product_images'

namespace :spree do
  task :product_images do
    run "rm -rf #{release_path}/public/spree && ln -nfs #{shared_path}/spree #{release_path}/public/spree"
  end
end

