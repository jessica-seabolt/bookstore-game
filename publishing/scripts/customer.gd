class_name Customer
extends Node2D

const WishlistItem = preload("res://publishing/scripts/wishlist_item.gd")

var _customer_name: String = NameGenerator.generate_name()
var _budget: float = roundf(randf_range(20, 100) * 100) / 100.0
var _wishlist: Array[WishlistItem] = []
var _inventory: Array[Book] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    _generate_wishlist()
    _browse_books()


func get_customer_name() -> String:
    return _customer_name


func _generate_wishlist() -> void:
    var books: Array[Book] = PublishingData.get_books()
    for book in books:
        var appeal: float = book.get_cover_appeal()
        var roll: float = randf()
        if roll <= appeal:
            _wishlist.append(WishlistItem.new(book, roll))
            
    _wishlist.sort_custom(_sort_by_priority)
        
        
func _sort_by_priority(a: Dictionary, b: Dictionary) -> bool:
    return b.priority < a.priority


func _browse_books() -> void:
    var total_spent: float = 0.0
    
    for item in _wishlist:
        var book: Book = item.book
        var price: float = book.get_retail_price()
        
        if book in Bookstore.get_inventory():
            if total_spent + price <= _budget:
                _inventory.append(book)
                Bookstore.remove_book(book)
                total_spent += price
            
    Bookstore.do_transaction(self, _inventory)
