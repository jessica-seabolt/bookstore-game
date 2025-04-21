extends Node

const customer = preload("res://customer/scenes/customer.tscn")
const books_menu = preload("res://ui/scenes/books_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    # Initialize game
    _init_time()
    
    # Create test data
    var publisher = Publisher.new("Test Publisher")
    PublishingData.add_publisher(publisher)
    
    $Bookstore.transaction_made.connect($HUD.update_last_purchase_label)


# Initialize the time signal and start timer
func _init_time():
    $Time.make_customer_signal.connect(_make_customer)
    $Time.update_time.connect($HUD.update_time_label)
    $Time.start()

# Create a new customer when signaled by timer
func _make_customer():
    var newCustomer = customer.instantiate()
    newCustomer.do_transaction.connect($Bookstore.do_transaction)
    add_child(newCustomer)
