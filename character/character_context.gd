# DI class for storing all the objects related to character
class_name CharacterContext
extends Node


@export var character: Character
@export var state_machine_master: StateMachineMaster
@export var behavior_manager: CharacterBehaviorManager
@export var ability_manager: CharacterAbilityManager
@export var properties: CharacterProperties


# Components
@export var ledge_climb_detector: LedgeClimbDetector
@export var weapon_adapter: WeaponAdapter
