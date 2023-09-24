class_name CharacterStateMachine
extends StateMachine

@export var context: CharacterContext


func _ready() -> void:
	var character = context.character
	# State machine assignes character object to all states
	for child in get_children():
		if child is CharacterState:
			child.character = character
			child.init()
	
	# General state machine logic
	super._ready()
