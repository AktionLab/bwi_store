class CreateUserGroupsVariants < ActiveRecord::Migration
  def change
    create_table :user_groups_variants do |t|
      t.references :user_group
      t.references :variant
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :user_groups_variants, :user_group_id
    add_index :user_groups_variants, :variant_id
  end
end
