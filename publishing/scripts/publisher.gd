class_name Publisher
extends Node


var _publisher_name: String = ""
var _catalogs_dict: Dictionary[String, Catalog] = {} # Key is [YxQx] and value is corresponding catalog


# TODO: Allow year and quarter to be passed for publishers that are not available at start of game
func _init(publisher_name: String):
    self._publisher_name = publisher_name
    self._catalogs_dict["Y1Q1"] = Catalog.new(self, "Y1Q1") # Test catalog
    PublishingData.add_catalog(_catalogs_dict["Y1Q1"]) # Register catalog with PublishingData
    
    # TODO: Make this a UI notification
    print("New Catalog from " + self._publisher_name + " is ready!")
    for book in self._catalogs_dict["Y1Q1"].get_books():
        print(book.get_title() + " by " + book.get_author().get_author_name())
    
    PublishingData.add_publisher(self) # Register publisher with PublishingData


func get_publisher_name() -> String:
    return self._publisher_name


func get_catalogs():
    return self._catalogs_dict
