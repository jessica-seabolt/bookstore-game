# Global data for storing and reading all authors, books, publishers
extends Node


var _authors_list = []
var _books_list = []
var _publishers_list = []


func _init(): 
    pass

func get_authors_list():
    return self._authors_list
    
    
func get_books_list():
    return self._books_list
    

func get_publishers_list():
    return self._publishers_list
    
    
func add_author(author: Author):
    self._authors_list.append(author)
    
    
func add_book(book):
    self._books_list.append(book)
    
    
func add_publisher(publisher):
    self._publishers_list.append(publisher)
