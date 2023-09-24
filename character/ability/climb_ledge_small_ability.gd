class_name ClimbSmallLedgeAbility
extends CharacterAbility

@export var force: float = 2


func can_execute() -> bool:
	return _default_execute_condition() and context.ledge_climb_detector.is_in_foot_reach()


func _execute() -> void:
	climb()
	character.behavior_manager.deactivate("LedgeClimbing")
	character.behavior_manager.deactivate("Gravity")


func climb() -> void:
	character.velocity.y = force


func on_duration_ends():
	character.behavior_manager.activate("LedgeClimbing")
	character.behavior_manager.activate("Gravity")
