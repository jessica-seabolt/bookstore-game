class_name BuyBottomRowVBoxContainer
extends HBoxContainer

# Node paths
const PRICE_LABEL: String = "PriceLabel"
const BUY_BUTTON: String = "BuyButton"

# Updates total price when purchase quantity changes
func on_qty_line_edit_text_changed(new_qty: String, old_qty: String, buy_bottom_row_h_box_container: HBoxContainer, buy_price: float) -> void:
    var price_label: Label = buy_bottom_row_h_box_container.get_node(PRICE_LABEL)

    # Calculate price difference and update total
    var delta: float = (float(new_qty) - float(old_qty)) * buy_price
    var current_total: float = extract_price_from_label(price_label.text)
    current_total += delta
    price_label.text = "Price: $%.2f" % current_total

    # Update whether button is enabled or disabled
    update_buy_button_state()

# Enables/disables buy button based on available funds
func update_buy_button_state() -> void:
    var price_label: Label = get_node(PRICE_LABEL)
    var buy_button: Button = get_node(BUY_BUTTON)
    var current_total: float = extract_price_from_label(price_label.text)
    var funds: float = BookstoreData.get_funds()

    if current_total <= funds and current_total > 0:
        price_label.add_theme_color_override("font_color", Color(0, 1, 0))  # Green
        buy_button.disabled = false
    else:
        price_label.add_theme_color_override("font_color", Color(1, 0, 0))  # Red
        buy_button.disabled = true

# Extract price value from formatted label text
func extract_price_from_label(text: String) -> float:
    return float(text.strip_edges().trim_prefix("Price: $"))
