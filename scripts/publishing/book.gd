class_name Book
extends Node


var _publisher
var _title
var _author
var _genre
var _cover_appeal
var _retail_price
var _buy_price
var _trending = false


func _init(publisher):
    self._publisher = publisher
    self._title = _init_title()
    self._author =  _init_author()
    self._genre = _init_genre(self._author)
    self._cover_appeal = _init_cover_appeal()
    self._retail_price = _init_retail_price()
    self._buy_price = _init_buy_price()
    PublishingData.add_book(self)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func get_title():
    return self._title
    

func get_author():
    return self._author
    

func get_genre():
    return self._genre
    
    
func get_cover_appeal():
    return self._cover_appeal
    
    
func get_buy_price():
    return self._buy_price
    
    
func get_retail_price():
    return self._retail_price
    
    
func get_trending():
    return self._trending


func _init_title():
    return NamingFormats.get_title_words().pick_random()


func _init_author():
    var first_name = NamingFormats.get_first_names().pick_random()
    var last_name = NamingFormats.get_last_names().pick_random()
    return first_name + " " + last_name # Combine first and last names


func _init_genre(author):
    # TODO: Add better genre selection
    var genre_index = randi() % Genre.Genre.values().size()
    return Genre.Genre.values()[genre_index]


func _init_cover_appeal():
    var appeal = randf_range(0.1, 0.9) # Random cover appeal 10% - 90%
    return round(appeal * 100) / 100.0


func _init_retail_price():
    var price = randf_range(10.00, 25.00)
    return round(price * 100) / 100.00


func _init_buy_price(): # 40% - 60% of retail price
    var price_multiplier = randf_range(0.4, 0.6)
    return round(self._retail_price * price_multiplier * 100) / 100.0
