extends Control

const CATALOG_ROW = preload("res://ui/scenes/catalog_row.tscn")

# Node paths
const CATALOG_ROW_H_BOX_CONTAINER: String = "CatalogsPanel/HeaderRowVBoxContainer/HBoxContainer"
const CLOSE_BUTTON: String = "CatalogsPanel/HeaderRowVBoxContainer/Panel/HBoxContainer/CloseButton"

func _ready() -> void:
    var close_button = get_node(CLOSE_BUTTON)
    close_button.pressed.connect(on_close_button_pressed)

# Populate the rows with every catalog
func populate_catalog_rows() -> void:
    var container: HBoxContainer = get_node(CATALOG_ROW_H_BOX_CONTAINER)
    var children = container.get_children()
    for child in children:
        child.queue_free()

    for catalog in PublishingData.get_catalogs():
        var catalog_row: Button = CATALOG_ROW.instantiate()
        catalog_row.update_catalog_row_labels(catalog)
        catalog_row.pressed.connect(on_catalog_selected.bind(catalog))
        container.add_child(catalog_row)

# Open associated books menu
func on_catalog_selected(catalog: Catalog) -> void:
    var books_menu = load("res://ui/scenes/books_menu.tscn").instantiate()
    books_menu.populate_book_rows(catalog)
    get_parent().add_child(books_menu)
    queue_free()


# Closes the menu
func on_close_button_pressed() -> void:
    queue_free()
