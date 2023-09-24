class_name DashAbility
extends CharacterAbility


func can_execute() -> bool:
	return _default_execute_condition() and character.is_moving()


func on_duration_ends():
	(character.state_machine_master.state_machines.get("MovementStateMachine")
		.transition_to("BaseState"))
	
	restore_uses()


func on_cooldown_ends():
	print("You can dash now!")


func _execute() -> void:
	(character.state_machine_master.state_machines.get("MovementStateMachine")
		.transition_to("Dash"))
