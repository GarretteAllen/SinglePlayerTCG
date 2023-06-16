extends Node

const sqlWrapper = preload("res://addons/godot-sqlite/gdsqlite.gdextension")
var db # Database object
var db_name = "res://database/database"

func _ready():
	pass
	
func commitToDB(tableName):
	db = sqlWrapper.new()
	db.path = db_name
	
	if tableName == "PlayerInfo":
		# Player related database queries for insertion
		pass
	if tableName == "CardInventory":
		# Card related database queries for insertion
		pass
