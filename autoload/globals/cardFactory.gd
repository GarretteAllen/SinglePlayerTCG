extends Node

class_name cardFactory

func createCardSprite(cardData):
	var sprite = Sprite2D.new()
	sprite.texture = cardData["graphics"]
	
	return sprite
	
	# Old and replaced
	
func instanceCards(cardData):
	var cardDataArray = []
	for i in cardData:
		var cardResource = load("res://cardResources/" + i + "/" + i + ".tres")
		var scenePath = cardResource.graphics
		cardDataArray.append(scenePath)
	return cardDataArray
	
	
	
