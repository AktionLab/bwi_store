Order.class_eval do
  def associate_user!(user)
    self.user = user
    self.email = user.email

    self.user.create_adjustment_for(self)

    save(:validate => false)
  end
end

