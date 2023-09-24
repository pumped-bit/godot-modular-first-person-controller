class_name AirJump
extends JumpAbility


func can_execute() -> bool:
	return _default_execute_condition() and !character.is_on_floor()
