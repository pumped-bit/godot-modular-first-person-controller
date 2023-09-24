class_name BaseState
extends CharacterState


func handle_input(_event: InputEvent) -> void:
	if (Input.is_action_just_pressed("jump")
		and character.ability_manager.trigger("Jump")):
		print("Jump!")


func physics_update(_delta: float) -> void:
	if character.is_moving():
		state_machine.transition_to("Move")
	
	if character.is_falling():
		state_machine.transition_to("Fall")


func enter(_msg := {}) -> void:
	character.capture_mouse()
	character.behavior_manager.activate("Gravity")
	
	var run_behavior: RunBehavior = character.behavior_manager.get_behavior("Run")
	run_behavior.speed = 0
	run_behavior.acceleration = (character.properties.default.behavior.move.ground.acceleration)
	
	character.ability_manager.restore_uses("AirJump")


func exit() -> void:
	pass
