class_name BuyBottomRowVBoxContainer
extends HBoxContainer

var _total_price: float = 0.00

func on_qty_line_edit_text_changed(new_qty: String, old_qty: String, buy_price: float, price_label: Label) -> void:
    print("Hello?5")
    
    var new_qty_val := float(new_qty)
    var old_qty_val := float(old_qty)
    
    var delta := (new_qty_val - old_qty_val) * buy_price
    _total_price += delta

    price_label.text = "Price: $%.2f" % _total_price
