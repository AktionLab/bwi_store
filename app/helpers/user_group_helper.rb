module UserGroupHelper
  def user_group_price_diff(product)
    variant = product.variants.first
    return nil if User.current.nil? || User.current.user_group.nil?
    diff = variant.read_attribute(:price) - variant.price
    return nil if diff == 0
    diff
  end
end

