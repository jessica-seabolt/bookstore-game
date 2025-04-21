class_name Author
extends Node

# Author metadata
var _author_name: String
var _books: Array[Book] = []

func _init():
    _author_name = NameGenerator.generate_name()
    PublishingData.add_author(self) # Register author in PublishingData


func get_author_name():
    return _author_name
    
# Creates a new book by this author with the specified publisher
func create_book(publisher: Publisher) -> Book:
    var new_book = Book.new(self, publisher)
    _books.append(new_book)
    return new_book
