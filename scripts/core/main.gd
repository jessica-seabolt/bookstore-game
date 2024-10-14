extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    print("Hello?")
    $CustomerTimer.start()
    PublishingData.get_publishers_list().append(Publisher.new("Test Publisher"))
    Bookstore.get_inventory()[PublishingData.get_publishers_list()[0].get_catalogs()["Y1Q1"].get_books()[0]] = 20
    Bookstore.get_inventory()[PublishingData.get_publishers_list()[0].get_catalogs()["Y1Q1"].get_books()[1]] = 3
    Bookstore.get_inventory()[PublishingData.get_publishers_list()[0].get_catalogs()["Y1Q1"].get_books()[2]] = 14


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_customer_timer_timeout():
    print("Making customer!")
    add_child(Customer.new())
