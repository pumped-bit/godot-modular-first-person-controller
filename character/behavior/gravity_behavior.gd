class_name GravityBehavior
extends CharacterBehavior

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# TODO: find a vay to init this property
#@onready var gravity_multiplier = character.properties.default.behavior.gravity.multiplier
var gravity_multiplier: int


func init() -> void:
	gravity_multiplier = character.properties.default.behavior.gravity.multiplier


func physics_update(_delta: float) -> void:
	apply_gravity(_delta)


func apply_gravity(_delta):
	character.velocity.y -= gravity * gravity_multiplier * _delta
