class_name FallState
extends MoveState


func handle_input(_event: InputEvent) -> void:
	if (Input.is_action_just_pressed("jump")
		and character.ability_manager.trigger("AirJump")):
		print("Jump!")
	
	if(Input.is_action_just_pressed("dash")
		and character.ability_manager.trigger("Dash")):
		print("Dash!")


func physics_update(_delta: float) -> void:	
	if character.is_on_floor():
		state_machine.transition_to("BaseState")


func enter(_msg := {}) -> void:
	character.behavior_manager.activate("Gravity")
	
	var run_behavior: RunBehavior = character.behavior_manager.get_behavior("Run")
	run_behavior.speed = (character.properties.default.behavior.move.air.speed)
	run_behavior.acceleration = (character.properties.default.behavior.move.air.acceleration)


func exit() -> void:
	pass
