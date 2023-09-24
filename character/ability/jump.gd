class_name JumpAbility
extends CharacterAbility

@export var force: float


func can_execute() -> bool:
	return _default_execute_condition() and character.is_on_floor()


func _execute() -> void:
	(character.state_machine_master.state_machines.get("MovementStateMachine")
		.transition_to("Jump"))
	_jump()


func _jump() -> void:
	character.velocity.y = force
