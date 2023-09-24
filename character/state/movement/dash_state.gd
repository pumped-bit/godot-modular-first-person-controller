class_name DashState
extends MoveState

var speed: float
var acceleration: float
var direction: Vector3
@export var speed_lines: CanvasItem

func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	dash()


func enter(_msg := {}) -> void:
	character.behavior_manager.deactivate("Gravity")
	speed_lines.visible = true
	
	speed = (character.properties.default.ability.dash.speed)
	acceleration = (character.properties.default.ability.dash.acceleration)
	
	var run_behavior: RunBehavior = character.behavior_manager.get_behavior("Run")
	run_behavior.speed = 0
	run_behavior.acceleration = 0
	
	direction = character.movement_direction


func exit() -> void:
	character.behavior_manager.activate("Gravity")
	speed_lines.visible = false
	direction = Vector3.ZERO


func dash() -> void:
	var _dash_velocity = direction * speed
	character.velocity.x = lerp(character.velocity.x, _dash_velocity.x, acceleration)
	character.velocity.z = lerp(character.velocity.z, _dash_velocity.z, acceleration)	
