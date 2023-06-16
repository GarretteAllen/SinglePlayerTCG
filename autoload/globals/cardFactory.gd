extends Node

class_name cardFactory

func createCardSprite(cardData):
	var sprite = Sprite2D.new()
	sprite.texture = cardData["inHandImage"]
	
	return sprite
	
	
