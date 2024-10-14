extends Node


var _funds = 0
var _inventory = {"Title" : 20}


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


func do_transaction(customer: Customer, item: Book):
	# TODO check if customer has money available
	print(customer.get_name() + "is buying" + item.get_title())
	if (_inventory.has(item)):
		_inventory.erase(item)
		_funds += item.get_retail_price()
