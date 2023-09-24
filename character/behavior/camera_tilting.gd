class_name CameraTilting
extends CharacterBehavior

@export var force: float
@export var acceleration: float
@export var camera: Camera3D

var _tilt: float 


func physics_update(_delta: float) -> void:
	tilt()


func tilt():
	var target_tilt = -character.input_vector.x * force
	_tilt = lerp(_tilt, target_tilt, acceleration)
	camera.rotation.z = (deg_to_rad(_tilt))
