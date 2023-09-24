class_name ClimbBigLedgeAbility
extends CharacterAbility


func can_execute() -> bool:
	return _default_execute_condition() and context.ledge_climb_detector.is_in_arms_reach()


func on_duration_ends():
	(character.state_machine_master.state_machines.get("MovementStateMachine")
		.transition_to("BaseState"))
	
	character.behavior_manager.activate("LedgeClimbing")


func _execute() -> void:
	(character.state_machine_master.state_machines.get("MovementStateMachine")
		.transition_to("ClimbBigLedge"))
	
	character.behavior_manager.deactivate("LedgeClimbing")
