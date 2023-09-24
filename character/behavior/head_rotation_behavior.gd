class_name HeadRotationBehavior
extends CharacterBehavior

@export_range(0.1, 9.25, 0.05, "or_greater") var camera_sensitivity: float = 3


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	if _event is InputEventMouseMotion: character.look_direction = _event.relative * 0.01


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	if character.is_mouse_captured:
		rotate_head(_delta)


func rotate_head(delta: float, sens_mod: float = 1.0) -> void:
	character.look_direction += Input.get_vector("look_left","look_right","look_up","look_down")
	
	character.head.rotation.y -= character.look_direction.x * camera_sensitivity * sens_mod * delta
	character.head.rotation.x = clamp(character.head.rotation.x - character.look_direction.y 
		* camera_sensitivity * sens_mod * delta, -1.5, 1.5)
	
	character.look_direction = Vector2.ZERO
