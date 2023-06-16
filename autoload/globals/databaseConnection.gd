extends Node

var db : SQLite = null
var db_name = "res://database/database"

func _ready():
	pass
	
func commitToDB(tableName):
	db = SQLite.new()
	db.path = db_name
	
	if tableName == "PlayerInfo":
		# Player related database queries for insertion
		pass
	if tableName == "CardInventory":
		# Card related database queries for insertion
		pass

func testRead(tableName):
	db = SQLite.new()
	db.path = db_name
	
	if tableName == "CardInventory":
		var cardNames = []
		print(tableName)
		db.open_db()
		db.query("select * from " + tableName + ";")
		for i in range(0, db.query_result.size()):
			print("Query results ", db.query_result[i]["Name"])
			cardNames.append(db.query_result[i]["Name"])
			
		return cardNames
	else:
		print("You done fucked up")
