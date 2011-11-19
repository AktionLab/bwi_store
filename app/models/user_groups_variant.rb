class UserGroupsVariant < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :variant
end
