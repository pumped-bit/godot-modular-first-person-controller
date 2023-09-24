class_name Reloadable
extends Node


@export var ammo: Ammo
@export var max_ammo_per_magazine: int
@export var reload_time: float
var current_ammo_in_magazine: int


# maybe this should be reimplemented with signals
func reload(callback) -> bool:
	if ammo.is_ammo_available():
		on_reload()
		callback.call()
		return true
	return false


func on_reload() -> void:
	pass


func has_available_ammo() -> bool:
	return current_ammo_in_magazine > 0
