class_name Publisher
extends Node


var _name = null
var _catalogs_dict = {}
var _relationship_score = 0
var _is_unlocked = false



func _init(publisher_name):
    self._name = publisher_name
    self._catalogs_dict["Y1Q1"] = Catalog.new(self) # Test catalog
    
    # TODO: Make this a UI notification
    print("New Catalog from " + self._name + " is ready!")
    for book in self._catalogs_dict["Y1Q1"].get_books():
        print(book.get_title() + " by " + book.get_author())
    PublishingData.add_publisher(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func get_catalogs():
    return self._catalogs_dict
