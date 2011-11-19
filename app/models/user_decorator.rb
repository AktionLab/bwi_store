User.class_eval do
  attr_accessible :user_group_id

  belongs_to :user_group

  def create_adjustment_for(order)
    return false
  end
end

