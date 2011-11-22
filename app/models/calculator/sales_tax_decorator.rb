Calculator::SalesTax.class_eval do
  def compute(order)
    rate = self.calculable
    line_items = order.line_items.select {|li| li.product.tax_category == rate.tax_category}
    amount = line_items.map {|li| li.total * rate.amount}.reduce(:+)
    amount += (order.ship_total * rate.amount)
  end
end

