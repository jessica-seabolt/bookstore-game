extends Control

const BOOK_ROW_SCENE = preload("res://ui/scenes/book_row.tscn")
const CATALOGS_MENU_SCENE = preload("res://ui/scenes/catalogs_menu.tscn")

# Books Menu Paths
const BOOKS_MENU_PANEL: String = "BooksMenuPanel"
const HEADER_ROW_V_BOX_CONTAINER: String = "BooksMenuPanel/HeaderRowVBoxContainer"
const PANEL: String = "BooksMenuPanel/HeaderRowVBoxContainer/Panel"
const BUY_BOTTOM_ROW_H_BOX_CONTAINER: String = "BooksMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer"
const BUY_BUTTON: String = "BooksMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer/BuyButton"
const PRICE_LABEL: String = "BooksMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer/PriceLabel"
const BOOK_ROW_SCROLL_CONTAINER: String = "BooksMenuPanel/HeaderRowVBoxContainer/BookRowScrollContainer"
const BOOK_ROW_V_BOX_CONTAINER: String = "BooksMenuPanel/HeaderRowVBoxContainer/BookRowScrollContainer/BookRowVBoxContainer"
const CLOSE_BUTTON: String = "BooksMenuPanel/HeaderRowVBoxContainer/HeaderRowPanel/HBoxContainer/CloseButton"
const BACK_BUTTON: String = "BooksMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer/BackButton"

# Book Row Paths
const TITLE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/TitleLabel"
const AUTHOR_LABEL: String = "HBoxContainer/BookRowHBoxContainer/AuthorLabel"
const GENRE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/GenreLabel"
const COVER_APPEAL_LABEL: String = "HBoxContainer/BookRowHBoxContainer/CoverAppealLabel"
const RETAIL_PRICE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/RetailPriceLabel"
const BUY_PRICE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/BuyPriceLabel"
const IN_STOCK_LABEL: String = "HBoxContainer/BookRowHBoxContainer/InStockLabel"
const QTY_LINE_EDIT: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit"


func _ready() -> void:
    var book_row_container = get_node(BOOK_ROW_V_BOX_CONTAINER)
    var buy_button = get_node(BUY_BUTTON)
    var price_label = get_node(PRICE_LABEL)
    var close_button = get_node(CLOSE_BUTTON)
    var back_button = get_node(BACK_BUTTON)
    
    # Connect signals to update UI when inventory or funds change
    BookstoreData.change_inventory.connect(book_row_container.on_bookstore_data_change_inventory)
    BookstoreData.funds_changed.connect(on_funds_changed)
    buy_button.pressed.connect(BookstoreData.on_buy_button_pressed.bind(price_label, book_row_container))
    close_button.pressed.connect(on_close_button_pressed)
    back_button.pressed.connect(on_back_button_pressed)

# Fills the books menu with books from the given books
func populate_book_rows(catalog: Catalog) -> void:
    var book_row_v_box_container = get_node(BOOK_ROW_V_BOX_CONTAINER)
    var buy_bottom_row_h_box_container: HBoxContainer = get_node(BUY_BOTTOM_ROW_H_BOX_CONTAINER)
    
    for book in catalog.get_books():
        var new_book_row = BOOK_ROW_SCENE.instantiate()
        var qty_line_edit: LineEdit = new_book_row.get_node(QTY_LINE_EDIT)
        var old_quantity: String = qty_line_edit.text
        
        # Set book information
        update_book_row_labels(new_book_row, book)
        
        # Set default value for purchase quantity
        qty_line_edit.text = "0"

        book_row_v_box_container.add_book_row(book, new_book_row, buy_bottom_row_h_box_container)
        
        # Connect quantity change signal to update the total price
        var buy_price := extract_price(new_book_row.get_node(BUY_PRICE_LABEL).text)
        qty_line_edit.text_changed.connect(buy_bottom_row_h_box_container.on_qty_line_edit_text_changed.bind(
            old_quantity, buy_bottom_row_h_box_container, buy_price))

# Updates buy button state when funds change
func on_funds_changed() -> void:
    var buy_bottom_row = get_node(BUY_BOTTOM_ROW_H_BOX_CONTAINER)
    buy_bottom_row.update_buy_button_state()
    

func on_close_button_pressed() -> void:
    queue_free()
    
    
func on_back_button_pressed() -> void:
    var catalogs_menu = CATALOGS_MENU_SCENE.instantiate()
    catalogs_menu.populate_catalog_rows()
    get_parent().add_child(catalogs_menu)
    queue_free()

# Updates book row labels with book information
func update_book_row_labels(book_row: Control, book: Book) -> void:
    book_row.get_node(TITLE_LABEL).text = book.get_title()
    book_row.get_node(AUTHOR_LABEL).text = book.get_author().get_author_name()
    book_row.get_node(GENRE_LABEL).text = Genre.get_genre_name(book.get_genre())
    book_row.get_node(COVER_APPEAL_LABEL).text = str("%.0f" % (book.get_cover_appeal() * 100)) + "%"
    book_row.get_node(RETAIL_PRICE_LABEL).text = "$" + str("%.2f" % book.get_retail_price())
    book_row.get_node(BUY_PRICE_LABEL).text = "$" + str("%.2f" % book.get_buy_price())
    book_row.get_node(IN_STOCK_LABEL).text = str(BookstoreData.get_inventory().get(book, 0))

# Extract price value from formatted label text
func extract_price(price_text: String) -> float:
    return float(price_text.trim_prefix("$"))
