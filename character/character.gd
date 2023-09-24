class_name Character
extends CharacterBody3D

@export var head: Node3D
@export var camera: Camera3D
@export var state_machine_master: StateMachineMaster
@export var behavior_manager: CharacterBehaviorManager
@export var ability_manager: CharacterAbilityManager
@export var properties: CharacterProperties

# Movement input as Vector
var input_vector: Vector2
# Look direction
var look_direction: Vector2
# Movement vector normalized with look direction
var movement_direction: Vector3
var is_mouse_captured: bool = false


func _unhandled_input(event):
	behavior_manager.handle_behaviors_input(event)


func _physics_process(delta):
	behavior_manager.behaviors_physics_update(delta)
	move_and_slide()


func is_moving() -> bool:
	return input_vector.length() != 0


func is_falling() -> bool:
	return !is_on_floor() and velocity.y < 0


func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	is_mouse_captured = true


func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	is_mouse_captured = false
