class_name MoveState
extends BaseState


func handle_input(_event: InputEvent) -> void:
	if (Input.is_action_just_pressed("jump")
		and character.ability_manager.trigger("Jump")):
		print("Jump!")
	
	if(Input.is_action_just_pressed("dash")
		and character.ability_manager.trigger("Dash")):
		print("Dash!")


func physics_update(_delta: float) -> void:	
	if !character.is_moving():
		state_machine.transition_to("BaseState")
	
	if character.is_falling():
		state_machine.transition_to("Fall")


func enter(_msg := {}) -> void:
	character.behavior_manager.activate("Gravity")
	
	var run_behavior: RunBehavior = character.behavior_manager.get_behavior("Run")
	run_behavior.speed = (character.properties.default.behavior.move.ground.speed)
	run_behavior.acceleration = (character.properties.default.behavior.move.ground.acceleration)


func exit() -> void:
	pass
