class_name Bookstore
extends Node


func _init() -> void:
    pass


func do_transaction(customer: Customer, books: Array[Book]) -> void:
    for book in books:
        print("{0} is buying {1} for ${2}".format([
            customer.get_customer_name(),
            book.get_title(),
            "%.2f" % book.get_retail_price()
        ]))
        
        BookstoreData.change_funds(book.get_retail_price())

    print("New funds: ${0}".format(["%.2f" % BookstoreData.get_funds()]))
