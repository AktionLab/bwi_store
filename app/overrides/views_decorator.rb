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
