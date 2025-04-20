extends RefCounted

var _book: Book
var _priority: float

func _init(book: Book, priority: float) -> void:
    self._book = book
    self._priority = priority
    
func get_priority() -> float:
    return _priority
    
func get_book() -> Book:
    return _book
