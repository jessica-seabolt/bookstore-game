extends Node

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
        
        
func change_funds(amt: float) -> float:
    _funds += amt
    return _funds
    
    
func remove_book(book: Book) -> void:
    if book in _inventory and _inventory[book] > 1:
        _inventory[book] -= 1
    else:
        _inventory.erase(book)
