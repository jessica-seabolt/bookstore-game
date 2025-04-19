class_name PublishingData

static var _authors_list: Array[Author] = []
static var _books_list: Array[Book] = []
static var _publishers_list: Array[Publisher] = []

static func get_authors() -> Array[Author]:
    return _authors_list.duplicate()

static func get_books() -> Array[Book]:
    return _books_list.duplicate()

static func get_publishers() -> Array[Publisher]:
    return _publishers_list.duplicate()

static func add_author(author: Author) -> void:
    _authors_list.append(author)

static func add_book(book: Book) -> void:
    _books_list.append(book)

static func add_publisher(publisher: Publisher) -> void:
    _publishers_list.append(publisher)
