extends Node

# Future home of the scene manager!
# Remember to instance a gui node (canvaslayer) onto each scene that is loaded in!
# If I plan on using GUI that is...?

func startGame():
# In essence will be the same as the change scene function, but it will also instance the player
# Into the scene!
	if playerVariables.isBoy:
		var startingScene = load("res://scenes/world/Overworld/Overworld.tscn")
		get_tree().change_scene_to_packed(startingScene)
		pass
	elif playerVariables.isGirl:
		var startingScene = load("res://scenes/world/Overworld/Overworld.tscn")
		get_tree().change_scene_to_packed(startingScene)

func changeScene(scene):
	get_tree().change_scene_to_packed(scene)
