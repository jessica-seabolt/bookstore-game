extends Node

const BUY_BUTTON: String = "CatalogsMenuPanel/HeaderRowVBoxContainer/Panel/BuyBottomRowHBoxContainer/BuyButton"

signal change_inventory
signal funds_changed(funds: int)

var _funds: float = 0.00
var _inventory: Dictionary[Book, int] = {}
var _open_hour: int = 9
var _open_minutes: int = 0
var _close_hour: int = 17
var _close_minutes: int = 0


func get_inventory() -> Dictionary[Book, int]:
    return _inventory


func get_funds() -> float:
    return _funds


func get_open_hour() -> int:
    return _open_hour


func get_open_minutes() -> int:
    return _open_minutes


func get_close_hour() -> int:
    return _close_hour


func get_close_minutes() -> int:
    return _close_minutes
    
    
func add_books(book: Book, quantity: int) -> void:
    if book in _inventory:
        _inventory[book] += quantity
    else:
        _inventory[book] = quantity
    
    change_inventory.emit(book, _inventory[book])
        
        
func change_funds(amt: float) -> float:
    _funds += amt
    funds_changed.emit(_funds)
    return _funds
    
    
func remove_book(book: Book) -> void:
    if book in _inventory and _inventory[book] > 1:
        _inventory[book] -= 1
        change_inventory.emit(book, _inventory[book])
    else:
        _inventory.erase(book)
        change_inventory.emit(book, 0)


func on_buy_button_pressed(price_label: Label, book_row_v_box_container: VBoxContainer) -> void:
    var total_price := float(price_label.text.strip_edges().replace("Price: $", ""))
    
    if total_price > _funds:
        print("Not enough funds!")
        return
    
    # Subtract funds
    change_funds(-total_price)
    
    # Loop through each book row
    for child in book_row_v_box_container.get_children():
        if not child is Control:
            continue
            
        var qty_line_edit: LineEdit = child.get_node("HBoxContainer/BookRowHBoxContainer/PurchaseQtyHBoxContainer/QtyLineEdit")
        var quantity: int = int(qty_line_edit.text)
        
        if quantity > 0:
            # Get the book this row corresponds to
            var title: String = child.get_node("HBoxContainer/BookRowHBoxContainer/TitleLabel").text
            
            # Find the book in PublishingData by title
            var book: Book = null
            for b in PublishingData.get_books():
                if b.get_title() == title:
                    book = b
                    break
                    
            if book != null:
                # Add books to inventory
                add_books(book, quantity)
                
                # Update the in-stock label
                var in_stock_label: Label = child.get_node("HBoxContainer/BookRowHBoxContainer/InStockLabel")
                in_stock_label.text = str(_inventory[book])
            else:
                print("Could not find book with title: ", title)
                
        # Reset the qty line edit to 0
        qty_line_edit.text = "0"
    
    # Reset total price display
    price_label.text = "Price: $0.00"
    price_label.add_theme_color_override("font_color", Color(1, 0, 0))  # Red
