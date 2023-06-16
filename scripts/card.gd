extends Resource

class_name Card

enum Type {
	normal,
	fire,
	water,
	electric
}

@export var name: String
@export var description: String
@export var graphics: PackedScene
@export var inHand: bool
@export var type: Type
@export var abilities: Array[Resource]
@export var cost: int
@export var attack: int
@export var health: int
# Add other exported variables as needed

# Methods

func summonCard():
	pass
	# Implement the logic for using the card
	# If player has enough resources to summon card, allow the summoning of card.
	
func cardAttack():
	pass
	# Calculate attack damage


