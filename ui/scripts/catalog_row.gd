extends Button

const PUBLISHER_LABEL: String = "CatalogRowHBoxContainer/HBoxContainer/PublisherLabel"
const CATALOG_LABEL: String = "CatalogRowHBoxContainer/HBoxContainer/CatalogLabel"

func update_catalog_row_labels(catalog: Catalog) -> void:
    var publisher_label: Label = get_node(PUBLISHER_LABEL)
    var catalog_label: Label = get_node(CATALOG_LABEL)
    
    publisher_label.text = catalog.get_publisher().get_publisher_name()
    catalog_label.text = catalog.get_catalog_name()
