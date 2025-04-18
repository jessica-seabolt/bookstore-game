class_name Author
extends Node

var _author_name


func _init(author_name):
    _author_name = author_name
    PublishingData.add_author(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func get_author_name():
    return _author_name
