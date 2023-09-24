class_name ClimbBigLedgeState
extends MoveState


@export var force: float
@export var acceleration: float


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	climb()


func enter(_msg := {}) -> void:
	character.behavior_manager.deactivate("Gravity")


func exit() -> void:
	character.behavior_manager.activate("Gravity")


func climb() -> void:
	character.velocity.y = lerp(character.velocity.y, force, acceleration)
