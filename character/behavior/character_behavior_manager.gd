class_name CharacterBehaviorManager
extends BehaviorManager

@export var context: CharacterContext


func init() -> void:
	var character: Character = context.character
#	TODO: fix this method calling twice
	# Set character for all behaviors in the dict
	for child in get_children():
		if child is CharacterBehavior:
			child.character = character
			child.context = context
	
	super.init()
