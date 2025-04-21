extends Node

const customer = preload("res://customer/scenes/customer.tscn")
const catalogs_menu = preload("res://ui/scenes/catalogs_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    # Initialize publishers and inventory
    _init_time()
    var publisher = Publisher.new("Test Publisher")
    PublishingData.add_publisher(publisher)
    var catalog = publisher.get_catalogs()["Y1Q1"]
    BookstoreData.add_books(catalog.get_books()[0], 20)
    BookstoreData.add_books(catalog.get_books()[2], 4)
    
    
    var menu_instance = catalogs_menu.instantiate()
    menu_instance.populate_book_rows(catalog)
    add_child(menu_instance)
    $Bookstore.transaction_made.connect($HUD.update_last_purchase_label)


# Initialize the time signal and start timer
func _init_time():
    $Time.make_customer_signal.connect(_make_customer)
    $Time.update_time.connect($HUD.update_time_label)
    $Time.start()

# Create a new customer
func _make_customer():
    var newCustomer = customer.instantiate()
    newCustomer.do_transaction.connect($Bookstore.do_transaction) # !!!!
    add_child(newCustomer)
