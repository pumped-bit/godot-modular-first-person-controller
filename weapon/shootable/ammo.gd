class_name Ammo
extends Node

@export var max_ammo: int
var current_ammo: int


func use_ammo(amount: int) -> void:
	current_ammo


func has_available_ammo() -> bool:
	return current_ammo > 0;
