extends Node


var _funds = 0
var _inventory = {}
var _open_hour = 9
var _open_minutes = 0
var _close_hour = 5
var _close_minutes = 0


func _init():
    print(PublishingData)  


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func get_inventory():
    return _inventory


func get_funds():
    return _funds


func get_open_hour():
    return _open_hour


func get_open_minutes():
    return _open_minutes


func get_close_hour():
    return _close_hour


func get_close_minutes():
    return _close_minutes


func do_transaction(customer: Customer, item: Book):
    # TODO check if customer has money available
    print(customer.get_cust_name() + " is buying " + item.get_title() + " for $" + str(item.get_retail_price()))
    if item in _inventory:
        if _inventory[item] > 1:
            _inventory[item] -= 1
        else:
            _inventory.erase(item)
        _funds += item.get_retail_price()
    print("New funds: " + str(_funds))
