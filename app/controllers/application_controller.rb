class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with :name => 'bwi_store', :password => 'bwimports' if Rails.env.staging?
end
