class_name Customer
extends Node2D

signal do_transaction(customer: Customer, inventory: Array[Book])

const WishlistItem = preload("res://customer/scripts/wishlist_item.gd")

var _customer_name: String = NameGenerator.generate_name()
var _budget: float = roundf(randf_range(20, 100) * 100) / 100.0 # Random budget $20-$100
var _wishlist: Array[WishlistItem] = []
var _inventory: Array[Book] = []
var _opinions: Array[float] = [] # From -0.1 to 0.1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    _generate_wishlist()
    _browse_books()
    queue_free() # Remove customer after transaction


func get_customer_name() -> String:
    return _customer_name
    
func get_opinions() -> Array[float]:
    return _opinions

# Creates a wishlist based on book cover appeal and random desire rolls
func _generate_wishlist() -> void:
    var books: Array[Book] = PublishingData.get_books()
    for book in books:
        var appeal: float = book.get_cover_appeal()
        var desire: float = randf()
        
        # Higher appeal increases chance of adding to wishlist
        if desire >= 1 - appeal:
            _wishlist.append(WishlistItem.new(book, desire))
            
    _wishlist.sort_custom(_sort_by_priority)
        
# Sorting function for wishlist items (higher desire first)
func _sort_by_priority(a: WishlistItem, b: WishlistItem) -> bool:
    return b.get_priority() > a.get_priority()

# Attempts to purchase books from wishlist based on budget
func _browse_books() -> void:
    
    var total_spent: float = 0.0
    
    for item in _wishlist:
        var book: Book = item.get_book()
        var price: float = book.get_retail_price()
        
        if book in BookstoreData.get_inventory():
            if total_spent + price <= _budget:
                _opinions.append(0.1) # Found book and can afford it
                _inventory.append(book)
                BookstoreData.remove_book(book) # Secures book for this customer
                total_spent += price
            else:
                _opinions.append(0.01) # Found book but can't afford it
        else:
            _opinions.append(-0.1) # Couldn't find book

        # Stop iterating if money is already spent
        if total_spent == _budget:
            break
    
    # Emit transaction signal if books were purchased
    if (_inventory.size() > 0):  
        do_transaction.emit(self, _inventory)
