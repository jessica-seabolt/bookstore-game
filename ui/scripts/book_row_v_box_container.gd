extends VBoxContainer


const MINUS_BUTTON: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/MinusButton"
const PLUS_BUTTON: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/PlusButton"
const QTY_LINE_EDIT: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit"
const IN_STOCK_LABEL: String = "HBoxContainer/BookRowHBoxContainer/InStockLabel"


var _book_rows: Dictionary[Book, Control] = {}


func add_book_row(book: Book, book_row: Control) -> void:
    var qty_line_edit: LineEdit = book_row.get_node(QTY_LINE_EDIT)
    
    _book_rows[book] = book_row
    add_child(book_row)
    book_row.get_node(MINUS_BUTTON).pressed.connect(on_minus_button_pressed.bind(qty_line_edit))
    book_row.get_node(PLUS_BUTTON).pressed.connect(on_plus_button_pressed.bind(qty_line_edit))
    

func on_bookstore_data_change_inventory(book: Book, quantity: int):
    var selected_row: Control = _book_rows[book]
    
    selected_row.get_node(IN_STOCK_LABEL).text = str(quantity)


func on_minus_button_pressed(book_quantity: LineEdit) -> void:
    if int(book_quantity.text) > 0:
        book_quantity.text = str(int(book_quantity.text) - 1)
    else:
        book_quantity.text = "0"


func on_plus_button_pressed(book_quantity: LineEdit) -> void:
    book_quantity.text = str(int(book_quantity.text) + 1)
