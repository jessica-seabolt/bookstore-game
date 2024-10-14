extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$CustomerTimer.start()
	print("Hi")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_customer_timer_timeout():
	print("Making customer!")
	add_child(Customer.new())
