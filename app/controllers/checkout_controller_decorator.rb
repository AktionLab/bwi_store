CheckoutController.class_eval do
  before_filter :validate_line_items

private

  def validate_line_items
    return true if current_order.nil?
    return true if current_order && current_order.completed?
    return true if Spree::Config[:allow_backorders]

    current_order.line_items.each do |li|
      if li.quantity > li.variant.on_hand
        flash[:error] = "#{flash[:error]}\nYou have tried to order more #{li.variant.name} than are available. Your cart has been updated to #{li.variant.on_hand}."
        li.update_attribute :quantity, li.variant.on_hand
        current_order.reload.update!
      end
    end
  end

  def before_address
    @order.bill_address ||= Address.default
    @order.ship_address ||= Address.default

    @order.user.create_adjustments_for(@order) if @order.user
  end
end

