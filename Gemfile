source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'jquery-rails'
gem 'unicorn'
gem 'mysql2'
gem 'spree', git: 'http://github.com/spree/spree.git', ref: '2169af5843fcbd07452d0f3aa809d75b20ef815d'
gem "spree_flexi_rate_shipping", "0.3.0.beta"
gem 'spree_static_content', git: 'http://github.com/spree/spree_static_content.git', branch: '0-70-stable'
gem 'memcache-client'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

group :development do
  gem 'ruby-debug19', require: 'ruby-debug'
  #gem 'capistrano'
  #gem 'capistrano-ext'
  #gem 'bz-cap-recipes', :git => "git://github.com/BZLabs/bz_cap_recipes.git"
end

group :test do
  gem 'turn', require: false
end

