extends Control

const book_row = preload("res://ui/scenes/book_row.tscn")
const QTY_LINE_EDIT: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit"
const BUY_PRICE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/BuyPriceLabel"

func _ready() -> void:
    BookstoreData.change_inventory.connect(get_node("CatalogsMenuPanel/HeaderRowVBoxContainer/BookRowScrollContainer/BookRowVBoxContainer").on_bookstore_data_change_inventory)

func populate_book_rows(catalog: Catalog) -> void:
    for book in catalog.get_books():
        var new_book_row = book_row.instantiate()
        var book_row_v_box_container = get_node("CatalogsMenuPanel/HeaderRowVBoxContainer/BookRowScrollContainer/BookRowVBoxContainer")
        var buy_bottom_row_h_box_container: HBoxContainer = get_node("CatalogsMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer")
        var qty_line_edit: LineEdit = new_book_row.get_node(QTY_LINE_EDIT)
        var old_quantity: String = qty_line_edit.text
        var price_text = new_book_row.get_node(BUY_PRICE_LABEL).text
        var buy_price: float = float(price_text.strip_edges().replace("$", ""))
        
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/TitleLabel").text = book.get_title()
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/AuthorLabel").text = book.get_author().get_author_name()
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/GenreLabel").text = Genre.get_genre_name(book.get_genre())
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/CoverAppealLabel").text = str("%.0f" % (book.get_cover_appeal() * 100)) + "%"
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/RetailPriceLabel").text = "$" + str("%.2f" % book.get_retail_price())
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/BuyPriceLabel").text = "$" + str("%.2f" % book.get_buy_price())
        
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/InStockLabel").text = str(BookstoreData.get_inventory().get(book, 0))

        # Set default value for purchase quantity
        new_book_row.get_node("HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit").text = "0"

        book_row_v_box_container.add_book_row(book, new_book_row)
        qty_line_edit.text_changed.connect(buy_bottom_row_h_box_container.on_qty_line_edit_text_changed.bind(old_quantity, buy_price, new_book_row.get_node("CatalogsMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer/PriceLabel")))
