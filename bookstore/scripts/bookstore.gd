class_name Bookstore

static var _funds: float = 0.00
static var _inventory: Dictionary[Book, int] = {}
static var _open_hour: int = 9
static var _open_minutes: int = 0
static var _close_hour: int = 17
static var _close_minutes: int = 0


static func _init() -> void:
    print(PublishingData)  


static func get_inventory() -> Dictionary[Book, int]:
    return _inventory


static func get_funds() -> float:
    return _funds


static func get_open_hour() -> int:
    return _open_hour


static func get_open_minutes() -> int:
    return _open_minutes


static func get_close_hour() -> int:
    return _close_hour


static func get_close_minutes() -> int:
    return _close_minutes
    
    
static func remove_book(book: Book) -> void:
    if book in _inventory and _inventory[book] > 1:
        _inventory[book] -= 1
    else:
        _inventory.erase(book)


static func do_transaction(customer: Customer, books: Array[Book]) -> void:
    for book in books:
        print("{0} is buying {1} for ${2}".format([
            customer.get_customer_name(),
            book.get_title(),
            "%.2f" % book.get_retail_price()
        ]))
        _funds += book.get_retail_price()
    
    print("New funds: ${0}".format(["%.2f" % _funds]))
