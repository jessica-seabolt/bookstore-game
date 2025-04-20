extends Control

const TIME_LABEL = 'HUDBox/TimeLabel' 
const FUNDS_LABEL = 'HUDBox/FundsLabel'
const LAST_PURCHASE_LABEL = 'HUDBox/LastPurchaseLabel'

func _ready() -> void:
    BookstoreData.funds_changed.connect(update_funds_label)


func update_time_label(time: String) -> void:
    get_node(TIME_LABEL).text = 'Time: ' + time


func update_funds_label(funds: float) -> void:
    get_node(FUNDS_LABEL).text = 'Funds: $%.2f' % funds
    
    
func update_last_purchase_label(lastPurchase: String) -> void:
    get_node(LAST_PURCHASE_LABEL).text = 'Last Purchase: ' + lastPurchase
    pass
