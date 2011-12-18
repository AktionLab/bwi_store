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

Deface::Override.new(:virtual_path  => 'products/_cart_form',
                     :insert_bottom => 'dl#product-price',
                     :partial       => 'products/sku_with_product_price',
                     :name          => 'cart_form_sku_with_product_price')

Deface::Override.new(:virtual_path  => 'orders/show',
                     :insert_before => 'div#order > p',
                     :partial       => 'orders/return_policy',
                     :name          => 'orders_return_policy')

Deface::Override.new(:virtual_path  => 'admin/shared/_tabs',
                     :insert_after  => "code[erb-loud]:contains(':users')",
                     :partial       => 'admin/shared/user_groups_tab',
                     :name          => 'admin_user_groups_tab',
                     :original      => '<%= tab :users %>')

Deface::Override.new(:virtual_path  => 'admin/users/_form',
                     :insert_after  => "[data-hook='admin_user_form_roles']",
                     :partial       => "admin/users/user_group",
                     :name          => 'admin_user_groups_user_form')

Deface::Override.new(:virtual_path  => 'products/_cart_form',
                     :insert_after  => 'span.variant-description',
                     :partial       => 'products/show_variant_quantity',
                     :name          => 'show_variant_quantity')

