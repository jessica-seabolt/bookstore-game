class_name Catalog
extends Node


var _publisher
var _books


func _init(publisher: Publisher):
    self._publisher = publisher
    self._books = _generate_books()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func get_publisher():
    return self._publisher
    
    
func get_books():
    return self._books
    

func _generate_books():
    var books_list = []
    for book in 30:
        books_list.append(Author.new().create_book(self._publisher))
    return books_list
