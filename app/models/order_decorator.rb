Order.class_eval do
  def associate_user!(user)
    self.user = user
    self.email = user.email

    self.user.create_adjustment_for(self)

    save(:validate => false)
  end

  def create_shipment!
    shipping_method(true)
    if shipment.present?
      shipment.update_attributes(:shipping_method => shipping_method)
    else
      self.shipments << Shipment.create(order => self, :shipping_method => shipping_method, :address => self.ship_address)
    end
    self.create_tax_charge!
  end

  def create_tax_charge!
    adjustments.tax.each {|e| e.destroy}
    return if self.user && self.user.user_group && self.user.user_group == UserGroup.find_by_name("Wholesale")
    TaxRate.match(ship_address).each {|r| r.create_adjustment(I18n.t(:tax), self, self, true)}
  end
end

