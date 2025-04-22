extends Node

signal change_inventory(book: Book, quantity: int)
signal funds_changed(funds: float)
signal reputation_changed(reputation: float)

# Node paths
const QTY_LINE_EDIT: String = "HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit"
const TITLE_LABEL: String = "HBoxContainer/BookRowHBoxContainer/TitleLabel"

var _funds: float = 10000.00 # Starting funds $10,000.00
var _reputation: float = 2.5 # Average rating between 0-5
var _customers_served: int = 0
var _inventory: Dictionary[Book, int] = {}
var _open_hour: int = 9
var _open_minutes: int = 0
var _close_hour: int = 17
var _close_minutes: int = 0


func get_inventory() -> Dictionary[Book, int]:
    return _inventory


func get_funds() -> float:
    return _funds
    
    
func get_reputation() -> float:
    return _reputation


func get_open_hour() -> int:
    return _open_hour


func get_open_minutes() -> int:
    return _open_minutes


func get_close_hour() -> int:
    return _close_hour


func get_close_minutes() -> int:
    return _close_minutes
    
# Add books to inventory or update quantity if already present
func add_books(book: Book, quantity: int) -> void:
    if book in _inventory:
        _inventory[book] += quantity
    else:
        _inventory[book] = quantity
    
    change_inventory.emit(book, _inventory[book])

# Change store funds and emit signal
func change_funds(amt: float) -> float:
    _funds += amt
    funds_changed.emit()
    return _funds
    
    
func change_reputation(amt: float) -> float:
    _reputation = clamp(_reputation + amt, 0.0, 5.0)
    reputation_changed.emit()
    return _reputation
    

func add_served_customer() -> int:
    _customers_served += 1
    return _customers_served

# Remove a book from inventory
func remove_book(book: Book) -> void:
    if book in _inventory and _inventory[book] > 1:
        _inventory[book] -= 1
        change_inventory.emit(book, _inventory[book])
    else:
        _inventory.erase(book)
        change_inventory.emit(book, 0)

# Handle Buy button press for purchasing books
func on_buy_button_pressed(price_label: Label, book_row_v_box_container: VBoxContainer) -> void:
    var total_price := extract_price_from_label(price_label.text)
    
    if total_price > _funds:
        print("Not enough funds!")
        return
    
    # Subtract funds
    change_funds(-total_price)
    
    # Process each book row
    process_book_purchases(book_row_v_box_container)
    
    # Reset total price display
    reset_price_display(price_label)

# Process book purchases from all rows with quantities > 0
func process_book_purchases(book_row_v_box_container: VBoxContainer) -> void:
    for child in book_row_v_box_container.get_children():
        if not child is Control:
            continue
            
        var qty_line_edit: LineEdit = child.get_node(QTY_LINE_EDIT)
        var quantity: int = int(qty_line_edit.text)
        
        if quantity > 0:
            # Get the book this row corresponds to
            var title: String = child.get_node(TITLE_LABEL).text
            var book: Book = find_book_by_title(title)
                    
            if book != null:
                # Add books to inventory
                add_books(book, quantity)
            else:
                print("Could not find book with title: ", title)
                
        # Reset the qty line edit to 0
        qty_line_edit.text = "0"

# Find a book by its title
func find_book_by_title(title: String) -> Book:
    for book in PublishingData.get_books():
        if book.get_title() == title:
            return book
    return null

# Reset the price label after purchase
func reset_price_display(price_label: Label) -> void:
    price_label.text = "Price: $0.00"
    price_label.add_theme_color_override("font_color", Color(1, 0, 0))  # Red

# Extract price value from formatted label text
func extract_price_from_label(text: String) -> float:
    return float(text.trim_prefix("Price: $"))
