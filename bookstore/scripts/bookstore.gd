class_name Bookstore
extends Node

signal transaction_made(transaction: String)

func _init() -> void:
    pass

# Processes a customer's purchase
func do_transaction(customer: Customer, books: Array[Book]) -> void:
    # TODO: Let player see full sales history, not just last purchased
    for book in books:
        # Emit a signal with transaction details for the UI
        transaction_made.emit("{0} is buying {1} for ${2}".format([
            customer.get_customer_name(),
            book.get_title(),
            "%.2f" % book.get_retail_price()
        ]))
        
        # Add the sale to the store's funds
        BookstoreData.change_funds(book.get_retail_price())
