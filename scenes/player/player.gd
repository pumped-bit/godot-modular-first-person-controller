class_name Player extends CharacterBody3D

@export_category("Player")
@export_range(1, 35, 1) var speed: float = 2 # m/s
@export_range(10, 400, 1) var acceleration: float = 100 # m/s^2

@export_range(0.1, 3.0, 0.1) var jump_height: float = 1 # m
@export_range(0.1, 3.0, 0.1) var dash_length: float = 5 # m
@export_range(0.1, 9.25, 0.05, "or_greater") var camera_sens: float = 3

var jumping: bool = false
var dashing: bool = false
var mouse_captured: bool = false

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var move_dir: Vector2
var look_dir: Vector2

var walk_dir: Vector3
var walk_vel: Vector3
var grav_vel: Vector3
var jump_vel: Vector3

@onready var camera: Camera3D = $Camera


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())


func _ready() -> void:
	if not is_multiplayer_authority(): return
	
	camera.current = true
	capture_mouse()


func _input(event: InputEvent) -> void:
	if not is_multiplayer_authority(): return
	
	if event is InputEventMouseMotion: look_dir = event.relative * 0.01
	if Input.is_action_just_pressed("jump"): jumping = true


func _physics_process(delta: float) -> void:
	if not is_multiplayer_authority(): return
	
	if mouse_captured: _rotate_camera(delta)
	velocity = _walk(delta) + _gravity(delta) + _jump(delta)
	move_and_slide()


func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true


func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false


func _rotate_camera(delta: float, sens_mod: float = 1.0) -> void:
	look_dir += Input.get_vector("look_left","look_right","look_up","look_down")
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod * delta
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod * delta, -1.5, 1.5)
	look_dir = Vector2.ZERO


func _walk(delta: float) -> Vector3:
	move_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var _forward: Vector3 = camera.transform.basis * Vector3(move_dir.x, 0, move_dir.y)
	walk_dir = Vector3(_forward.x, 0, _forward.z).normalized()
	walk_vel = walk_vel.move_toward(walk_dir * speed * move_dir.length(), acceleration * delta)
	return walk_vel


func _gravity(delta: float) -> Vector3:
	grav_vel = Vector3.ZERO if is_on_floor() else grav_vel.move_toward(Vector3(0, velocity.y - gravity, 0), gravity * delta)
	return grav_vel


func _jump(delta: float) -> Vector3:
	if jumping:
		if is_on_floor(): jump_vel = Vector3(0, sqrt(4 * jump_height * gravity), 0)
		jumping = false
		return jump_vel
	jump_vel = Vector3.ZERO if is_on_floor() else jump_vel.move_toward(Vector3.ZERO, gravity * delta)
	return jump_vel


func _on_ledge_detector_shoulder_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
