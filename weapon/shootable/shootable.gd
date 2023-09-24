class_name Shootable
extends Node3D

@export var is_active: bool
@export var cooldown_between_shots: float
@export var bullet: Bullet
@export var ammo: Ammo
@export var reloadable: Reloadable

var shoot_point: Node3D


func trigger() -> bool:
	if _default_shoot_conditions_fufilled():
		return _spawn_bullet()
	elif ammo.has_available_ammo():
		reloadable.reload(func(): on_reload())
	return false


func _spawn_bullet() -> bool:
	return true


func _default_shoot_conditions_fufilled() -> bool:
	return (is_active) and (reloadable != null and reloadable.has_available_ammo())


func on_reload() -> void:
	pass
