class AddShowOnHomepageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :show_on_homepage, :boolean, :default => false
  end
end
