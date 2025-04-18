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
    

# TODO: Generate more than 3 books lol
func _generate_books():
    var booksList = []
    for book in 3:
        booksList.append(Book.new(self._publisher))
    return booksList
