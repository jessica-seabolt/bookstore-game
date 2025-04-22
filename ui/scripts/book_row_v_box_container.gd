extends VBoxContainer

# Node paths
const MINUS_BUTTON: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/MinusButton"
const PLUS_BUTTON: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/PlusButton"
const QTY_LINE_EDIT: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit"
const IN_STOCK_LABEL: String = "HBoxContainer/BookRowHBoxContainer/InStockLabel"
const BUY_PRICE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/BuyPriceLabel"
const PRICE_LABEL: String = "PriceLabel"

# Maps books to their corresponding rows in the menu
var _book_rows: Dictionary[Book, Control] = {}


func get_book_rows() -> Dictionary[Book, Control]:
    return _book_rows

# Adds a new book row to the container and sets up its event connections
func add_book_row(book: Book, book_row: Control, buy_bottom_row_h_box_container: HBoxContainer) -> void:
    var qty_line_edit: LineEdit = book_row.get_node(QTY_LINE_EDIT)
    var price_text: String = book_row.get_node(BUY_PRICE_LABEL).text
    var buy_price: float = extract_price(price_text)
    
    # Track the row and add it to the UI
    _book_rows[book] = book_row
    add_child(book_row)
    
    # Connect button signals
    book_row.get_node(MINUS_BUTTON).pressed.connect(on_minus_button_pressed.bind(qty_line_edit, buy_price, buy_bottom_row_h_box_container))
    book_row.get_node(PLUS_BUTTON).pressed.connect(on_plus_button_pressed.bind(qty_line_edit, buy_price, buy_bottom_row_h_box_container))
    qty_line_edit.text_changed.connect(on_qty_line_edit_text_changed.bind(buy_bottom_row_h_box_container))
    

# Updates inventory display
func on_bookstore_data_change_inventory(book: Book, quantity: int):
    var selected_row: Control = _book_rows[book]
    selected_row.get_node(IN_STOCK_LABEL).text = str(quantity)

# Decreases purchase quantity and updates price total
func on_minus_button_pressed(book_quantity: LineEdit, buy_price: float, buy_bottom_row_h_box_container: HBoxContainer) -> void:
    var old_qty: int = int(book_quantity.text)
    var new_qty: int = old_qty - 1
    
    
    if old_qty > 0:
        book_quantity.text = str(new_qty)
        buy_bottom_row_h_box_container.on_qty_line_edit_text_changed(str(new_qty), str(old_qty), buy_bottom_row_h_box_container, buy_price)

# Increases purchase quantity and updates price total
func on_plus_button_pressed(book_quantity: LineEdit, buy_price: float, buy_bottom_row_h_box_container: HBoxContainer) -> void:
    var old_qty: int = int(book_quantity.text)
    var new_qty: int = old_qty + 1
    
    book_quantity.text = str(int(book_quantity.text) + 1)
    buy_bottom_row_h_box_container.on_qty_line_edit_text_changed(str(new_qty), str(old_qty), buy_bottom_row_h_box_container, buy_price)


func on_qty_line_edit_text_changed(_new_qty: String, buy_bottom_row_h_box_container: HBoxContainer) -> void:
    var total: float = 0.0
    for book in _book_rows.keys():
        var row: Control = _book_rows[book]
        var qty_line_edit: LineEdit = row.get_node(QTY_LINE_EDIT)
        var buy_price_label: Label = row.get_node(BUY_PRICE_LABEL)
        var qty: float = float(qty_line_edit.text) if qty_line_edit.text else 0.0
        var price: float = extract_price(buy_price_label.text)
        total += qty * price
    var price_label: Label = buy_bottom_row_h_box_container.get_node(PRICE_LABEL)
    price_label.text = "Price: $%.2f" % total
    
    # Update the buy button state
    buy_bottom_row_h_box_container.update_buy_button_state()


# Extract price value from formatted label text
func extract_price(price_text: String) -> float:
    return float(price_text.strip_edges().replace("$", ""))
