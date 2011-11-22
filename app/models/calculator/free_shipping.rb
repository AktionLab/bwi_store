class Calculator::FreeShipping < Calculator
  preference :amount, :decimal, :default => 0

  def self.description
    I18n.t("free_shipping")
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def avilable?(order)
    return false if order.item_total < 100
    return true if order.user.nil?
    return true if order.user.user_group.nil?
    return false if order.user.user_group.name == "Wholesale"
    return true
  end

  def compute(object=nil)
    0
  end
end

