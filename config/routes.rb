BwiStore::Application.routes.draw do
  root :to => 'taxons#show', :id => 'brand'
  namespace :admin do
    resources :flexi_shipping_rates
    resources :user_groups do
      member do
        get :pricing, :as => 'user_group'
      end
    end
  end
  
  match '/admin/user_groups/:id/pricing' => 'admin/userGroups#pricing', :as => 'user_group'
end
