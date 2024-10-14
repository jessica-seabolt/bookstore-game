class_name Book
extends Node


var _title
var _author
var _publisher
var _genre
var _cover_appeal
var _retail_price
var _buy_price
var _trending = false


func _init(title, author, publisher):
	_title = title
	_author = author
	_publisher = publisher
	_genre = _init_genre(author)
	_cover_appeal = _init_cover_appeal()
	_retail_price = _init_retail_price()
	_buy_price = _init_buy_price()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_title():
	return _title
	

func get_author():
	return _author
	

func get_genre():
	return _genre
	
	
func get_cover_appeal():
	return _cover_appeal
	
	
func get_buy_price():
	return _buy_price
	
	
func get_retail_price():
	return _retail_price
	
	
func get_trending():
	return _trending


func _init_genre(author):
	var genre_index = randi() % Genre.Genre.values().size()
	return Genre.Genre.values()[genre_index]


func _init_cover_appeal():
	var appeal = randf_range(0.1, 0.9)
	return round(appeal * 100) / 100.0
	
	
func _init_retail_price():
	var price = randf_range(10.00, 25.00)
	return round(price * 100) / 100.00
	
	
func _init_buy_price():
	var price_multiplier = randf_range(0.4, 0.6)
	return round(_retail_price * price_multiplier * 100) / 100.0
