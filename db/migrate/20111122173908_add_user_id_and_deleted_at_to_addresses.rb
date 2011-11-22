class AddUserIdAndDeletedAtToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :user_id, :integer
    add_column :addresses, :deleted_at, :datetime
  end
end
