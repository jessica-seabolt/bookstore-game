extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    # Initialize publishers and inventory
    _init_time()
    var publisher = Publisher.new("Test Publisher")
    PublishingData.add_publisher(publisher)
    var catalog = publisher.get_catalogs()["Y1Q1"]
    Bookstore.get_inventory()[catalog.get_books()[0]] = 20
    Bookstore.get_inventory()[catalog.get_books()[1]] = 3
    Bookstore.get_inventory()[catalog.get_books()[2]] = 14


# Initialize the time signal and start timer
func _init_time():
    $Time.make_customer_signal.connect(_make_customer)
    $Time.start()


# Create a new customer
func _make_customer():
    print("Making customer!")
    add_child(Customer.new())
