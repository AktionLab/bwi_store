class Calculator::PerVariantPricing < Calculator
  def self.description
    I18n.t("per_variant_pricing")
  end

  def description
    self.class.description
  end

  def has_pricing_config
    true
  end

  def self.register
    super
    UserGroup.register_calculator(self)
  end

  def compute(object)
    return unless object.present? && object.line_items.present && object.user.present? && object.user.user_group.present?

    item_total = object.line_items.map(&:amount).sum
    item_cost_price_total = object.line_items.map do |li|
      (li.variant.price * li.quantity) - ((UserGroupsVariant.where(:user_group_id => object.user.user_group.id, :variant_id => li.variant.id).try(:first).try(:price) || li.variant.price) * li.quantity)
    end.sum

    0 - item_cost_price_total
  end

  def compute_item(variant)
    variant.price_for_user(@current_user)
  end
end

