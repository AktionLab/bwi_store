# Shared
Deface::Override.new(:virtual_path  => "shared/_products",
                     :replace       => "[data-hook='products_list_item']",
                     :partial       => "shared/product_info",
                     :name          => "add_price_to_info_area_below_product_name",
                     :disabled      => false)

Deface::Override.new(:virtual_path  => "shared/_taxonomies",
                     :replace       => "h3.taxonomy-root",
                     :partial       => "shared/taxonomy_root_header",
                     :name          => "make_taxon_root_linkable",
                     :disabled      => false)

Deface::Override.new(:virtual_path  => 'shared/_order_details',
                     :insert_before => 'th.price',
                     :partial       => 'shared/order_details_sku_table_header',
                     :name          => 'add_sku_table_header_to_order_details',
                     :disabled      => false)

Deface::Override.new(:virtual_path  => 'shared/_order_details',
                     :insert_before => 'td.price',
                     :partial       => 'shared/order_details_sku_table_cell',
                     :name          => 'add_sku_table_cell_to_order_details',
                     :disabled      => false)

#Checkout
Deface::Override.new(:virtual_path  => 'checkout/_confirm',
                     :insert_top    => "[data-hook='buttons']",
                     :partial       => 'checkout/continue_shopping_button',
                     :name          => 'confirm_checkout_shopping_button')

Deface::Override.new(:virtual_path  => 'checkout/_delivery',
                     :insert_top    => "[data-hook='button']",
                     :partial       => 'checkout/continue_shopping_button',
                     :name          => 'delivery_checkout_shopping_button')

Deface::Override.new(:virtual_path  => 'checkout/_payment',
                     :insert_top    => "[data-hook='buttons']",
                     :partial       => 'checkout/continue_shopping_button',
                     :name          => 'payment_checkout_shopping_button')

Deface::Override.new(:virtual_path  => 'checkout/_payment',
                     :insert_after  => "[data-hook='checkout_payment_step'] > p",
                     :partial       => 'checkout/payment_method_description',
                     :name          => 'payment_method_description')

# Products
Deface::Override.new(:virtual_path  => 'products/_cart_form',
                     :insert_bottom => 'dl#product-price',
                     :partial       => 'products/sku_with_product_price',
                     :name          => 'cart_form_sku_with_product_price')

Deface::Override.new(:virtual_path  => 'products/_cart_form',
                     :insert_after  => 'span.variant-description',
                     :partial       => 'products/show_variant_quantity',
                     :name          => 'show_variant_quantity')

# Orders
Deface::Override.new(:virtual_path  => 'orders/show',
                     :insert_before => 'div#order > p',
                     :partial       => 'orders/return_policy',
                     :name          => 'orders_return_policy')

# Taxon
Deface::Override.new(:virtual_path  => 'taxons/_taxon',
                     :insert_bottom => "[data-hook='taxon']",
                     :partial       => 'taxons/taxon_child_link',
                     :name          => 'taxon_child_link')

# Admin/Shared
Deface::Override.new(:virtual_path  => 'admin/shared/_tabs',
                     :insert_after  => "code[erb-loud]:contains(':users')",
                     :partial       => 'admin/shared/user_groups_tab',
                     :name          => 'admin_user_groups_tab',
                     :original      => '<%= tab :users %>')

# Admin/Users
Deface::Override.new(:virtual_path  => 'admin/users/_form',
                     :insert_after  => "[data-hook='admin_user_form_roles']",
                     :partial       => "admin/users/user_group_form_field",
                     :name          => 'admin_user_groups_user_form')

Deface::Override.new(:virtual_path  => 'admin/users/index',
                     :insert_before => "[data-hook='admin_users_index_header_actions']",
                     :partial       => 'admin/users/user_group_index_header',
                     :name          => 'user_group_index_header')

Deface::Override.new(:virtual_path  => 'admin/users/index',
                     :insert_before => "[data-hook='admin_users_index_row_actions']",
                     :partial       => 'admin/users/user_group_index_row',
                     :name          => 'user_group_index_row')

Deface::Override.new(:virtual_path  => 'admin/users/index',
                     :insert_before => "[data-hook='admin_users_index_search_buttons']",
                     :partial       => 'admin/users/user_search_user_group',
                     :name          => 'user_search_user_group')

Deface::Override.new(:virtual_path  => 'admin/users/show',
                     :insert_after  => "[data-hook='roles']",
                     :partial       => 'admin/users/show_user_group',
                     :name          => 'show_user_group')

