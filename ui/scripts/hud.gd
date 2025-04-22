extends Control

const CATALOGS_MENU = preload("res://ui/scenes/catalogs_menu.tscn")

# Node paths
const TIME_LABEL: String = 'HUDHeader/HUDBox/TimeLabel' 
const FUNDS_LABEL: String = 'HUDHeader/HUDBox/FundsLabel'
const LAST_PURCHASE_LABEL: String = 'HUDHeader/HUDBox/LastPurchaseLabel'
const CATALOGS_BUTTON: String = 'Panel/CatalogsButton'
const REPUTATION_LABEL: String = 'Panel/ReputationLabel'

func _ready() -> void:
    # Connect to funds changed signal to keep UI updated
    BookstoreData.funds_changed.connect(update_funds_label)
    BookstoreData.reputation_changed.connect(update_reputation_label)
    get_node(CATALOGS_BUTTON).pressed.connect(on_catalogs_button_pressed)

# Update Time display on HUD
func update_time_label(time: String) -> void:
    get_node(TIME_LABEL).text = 'Time: ' + time

# Update funds display on HUD
func update_funds_label() -> void:
    get_node(FUNDS_LABEL).text = 'Funds: $%.2f' % BookstoreData.get_funds()
    
# Show last purchase on HUD
func update_last_purchase_label(lastPurchase: String) -> void:
    get_node(LAST_PURCHASE_LABEL).text = 'Last Purchase: ' + lastPurchase
    
func update_reputation_label() -> void:
    get_node(REPUTATION_LABEL).text = 'Reputation: %.1f' % BookstoreData.get_reputation() 

func on_catalogs_button_pressed() -> void:
    var catalogs_menu = CATALOGS_MENU.instantiate()
    catalogs_menu.populate_catalog_rows()
    add_child(catalogs_menu)
