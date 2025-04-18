class_name Customer
extends Node2D


var _cust_name = "John Doe"
var _funds = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    _browse_books()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _browse_books():
    var inventory = Bookstore.get_inventory()
    for item in inventory:
        Bookstore.do_transaction(self, item)


func get_cust_name():
    return _cust_name
    
    
func get_funds():
    return _funds
    
    
func set_funds(new_funds: float):
    _funds = new_funds
