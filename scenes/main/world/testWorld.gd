extends Node2D

var _cardFactory: cardFactory
#var _cardInstance: Card

func _ready():
	
	# Instance card factory for card instancing
	_cardFactory = cardFactory.new()
	
	# Retrieve card data
	# Use this for when we go into battle to populate an array, then use the bottom part of the code
	# To fill out the drawn cards etc...
	
	#var table = "CardInventory"
	#var cardData = DBConnect.testRead(table)
	#var cardScene = _cardFactory.instanceCards(cardData)
	#for i in cardScene:
		#var cardInstance = i.instantiate()
		#add_child(cardInstance)
	
	
	
	
