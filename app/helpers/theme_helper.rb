module ThemeHelper
  def product_set_meta_data
    taxon = Taxon.where(:permalink => 'brand')

    taxon.active_products
  end
end

