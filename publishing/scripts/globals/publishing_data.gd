extends Node

var _authors_list: Array[Author] = []
var _books_list: Array[Book] = []
var _publishers_list: Array[Publisher] = []

func get_authors() -> Array[Author]:
    return _authors_list.duplicate()

func get_books() -> Array[Book]:
    return _books_list.duplicate()

func get_publishers() -> Array[Publisher]:
    return _publishers_list.duplicate()

func add_author(author: Author) -> void:
    _authors_list.append(author)

func add_book(book: Book) -> void:
    _books_list.append(book)

func add_publisher(publisher: Publisher) -> void:
    _publishers_list.append(publisher)
