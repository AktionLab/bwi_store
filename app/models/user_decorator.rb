User.class_eval do
  attr_accessible :user_group_id

  belongs_to :user_group

  scope :sort_by_user_group_asc, includes(:user_group).order('user_groups.name ASC')
  scope :sort_by_user_group_desc, includes(:user_group).order('user_groups.name DESC')

  def create_adjustment_for(order)
    return false
  end
end

