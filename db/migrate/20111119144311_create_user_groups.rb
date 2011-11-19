class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name

      t.timestamps
    end

    change_table :users do |t|
      t.references :user_group
    end
  end
end
