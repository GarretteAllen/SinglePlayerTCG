extends Node

# Future home of the scene manager!
# Remember to instance a gui node (canvaslayer) onto each scene that is loaded in!
# If I plan on using GUI that is...?

func startGame():
# In essence will be the same as the change scene function, but it will also instance the player
# Into the scene!
	if playerVariables.newGame == true:
		if playerVariables.isBoy:
			var startingScene = load(playerVariables.overworldScene)
			get_tree().change_scene_to_packed(startingScene)
			pass
		elif playerVariables.isGirl:
			var startingScene = load(playerVariables.overworldScene)
			get_tree().change_scene_to_packed(startingScene)

func changeScene(scene):
	print(typeof(scene))
	if typeof(scene) == 24:
		get_tree().change_scene_to_packed(scene)
		scene = null
	if typeof(scene) == 4:
		var sceneLoaded = load(scene)
		get_tree().change_scene_to_packed(sceneLoaded)
		scene = null
