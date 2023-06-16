extends Node

var playerName:String : set = _set_playerName, get = _get_playerName

func _ready():
	pass

func _set_playerName(newPlayerName):
	playerName = newPlayerName

func _get_playerName():
	return playerName
