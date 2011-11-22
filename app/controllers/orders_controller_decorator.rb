OrdersController.class_eval do
  before_filter :validate_line_items

  def validate_line_items
    return true if current_order.nil?
    return true if current_order.completed?
    return true if Spree::Config[:allow_backorder]

    current_order.line_items.each do |li|
      if li.quantity > li.variant.on_hand
        flash[:error] = [flash[:error], "You have tried to order more #{li.variant.name} than are available. Your cart has been updated to #{li.variant.on_hand.to_s}."].join("\n")
        li.update_attribute(:quantity, li.variant.on_hand)
        current_order.reload.update!
      end
    end
  end
end

