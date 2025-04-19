class_name WishlistItem

extends RefCounted

var book: Book
var priority: float

func _init(book: Book, priority: float) -> void:
    self.book = book
    self.priority = priority
