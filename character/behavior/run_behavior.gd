class_name RunBehavior
extends CharacterBehavior

var _movement_velocity: Vector3
var speed: float
var acceleration: float


func physics_update(_delta: float) -> void:
	_update_movement_vector()
	_apply_movement_velocity()


func _update_movement_vector() -> void:
	character.input_vector = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var forward: Vector3 = (character.head.transform.basis 
		* Vector3(character.input_vector.x, 0, character.input_vector.y))
	character.movement_direction = Vector3(forward.x, 0, forward.z).normalized()


func _apply_movement_velocity():
	_movement_velocity = character.movement_direction * speed
	character.velocity.x = lerp(character.velocity.x, _movement_velocity.x, acceleration)
	character.velocity.z = lerp(character.velocity.z, _movement_velocity.z, acceleration)
