extends Node2D

var _cardFactory: cardFactory
var _cardInstance: Card

func _ready():
	
	# Instance card factory for card instancing
	_cardFactory = cardFactory.new()
	
	# Retrieve card data
	var cardData = load("res://cardResources/testCard1.tres")
	var cardSprite = _cardFactory.createCardSprite(cardData)
	add_child(cardSprite)
	
