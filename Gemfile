source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'jquery-rails'
gem 'unicorn'
gem 'mysql2'
gem 'spree', git: 'http://github.com/spree/spree.git', ref: '2169af5843fcbd07452d0f3aa809d75b20ef815d'
#gem "spree_flexi_rate_shipping", "0.3.0.beta"
#gem 'spree_flexi_rate_shipping', path: '/home/chris/code/spree/spree-flexi-rate-shipping'
gem 'spree_flexi_rate_shipping', git: 'git://github.com/BZLabs/spree-flexi-rate-shipping.git'
gem 'spree_static_content', git: 'http://github.com/spree/spree_static_content.git', branch: '0-70-stable'
gem 'spree_batch_products', git: 'http://github.com/BZLabs/spree-batch-products.git'
#gem 'spree_batch_products', path: '/home/chris/code/spree/spree-batch-products'
gem 'memcache-client'

gem 'spree_editor', git:'git://github.com/spree/spree_editor.git', branch: 'master'

group :production do
  gem 'airbrake'
end

group :production, :staging do
  gem 'newrelic_rpm'
end

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

group :development do
  gem 'rails-dev-tweaks', '~> 0.5.1'
  gem 'ruby-debug19', require: 'ruby-debug'
  gem 'capistrano'
  gem 'bz-cap-recipes', :git => "git://github.com/BZLabs/bz_cap_recipes.git"
  #gem 'bz-cap-recipes', path: '/home/chris/code/bz_cap_recipes'
end

group :test do
  gem 'turn', require: false
end

