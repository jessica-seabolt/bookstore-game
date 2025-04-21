class_name Catalog
extends Node


var _publisher: Publisher # Publisher that created this catalog
var _catalog_name: String # Name of the catalog
var _books: Array[Book] = [] # Books in this catalog


func _init(publisher: Publisher, catalog_name: String):
    self._publisher = publisher
    self._catalog_name = catalog_name
    self._books = _generate_books()


func get_publisher() -> Publisher:
    return self._publisher
    
    
func get_catalog_name() -> String:
    return self._catalog_name
    
    
func get_books() -> Array[Book]:
    return self._books
    
# Generates 30 random books for this catalog
func _generate_books() -> Array[Book]:
    var books_list: Array[Book] = []
    for book in 30:
        # TODO: Add logic to sometimes reuse authors/create sequel books
        books_list.append(Author.new().create_book(self._publisher))
    return books_list
