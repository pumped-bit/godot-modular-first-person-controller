class_name CharacterAbilityManager
extends AbilityManager

@export var context: CharacterContext


func init() -> void:
	var character: Character = context.character
	for child in get_children():
		if child is CharacterAbility:
			child.character = character
			child.context = context
	
	super.init()
