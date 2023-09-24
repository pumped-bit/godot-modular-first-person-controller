class_name LedgeClimbDetector
extends Node3D

@export var head_raycast: RayCast3D
@export var shoulder_raycast: RayCast3D
@export var foot_raycast: RayCast3D
# To update rotation
@export var head: Node3D


func _physics_process(_delta):
	rotation.y = head.rotation.y


func is_in_foot_reach() -> bool:
	return (!head_raycast.is_colliding()
		and !shoulder_raycast.is_colliding()
		and foot_raycast.is_colliding())


func is_in_arms_reach() -> bool:
		return (!head_raycast.is_colliding() and shoulder_raycast.is_colliding())
