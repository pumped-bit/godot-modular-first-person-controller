class_name HitscanBullet
extends Node

@onready var shootable: HitscanShootable
@onready var raycast: RayCast3D


func _ready():
	shootable = get_parent()
	raycast = shootable.raycast


func on_spawn() -> void:
	pass
