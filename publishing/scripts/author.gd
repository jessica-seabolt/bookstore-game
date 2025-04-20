class_name Author
extends Node

var _author_name: String
var _books: Array[Book] = []

func _init():
    _author_name = NameGenerator.generate_name()
    PublishingData.add_author(self)


func get_author_name():
    return _author_name
    
    
func create_book(publisher: Publisher) -> Book:
    var new_book = Book.new(self, publisher)
    _books.append(new_book)
    return new_book
