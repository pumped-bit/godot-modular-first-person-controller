class_name CharacterProperties
extends Node

var default = {
	"behavior": {
		"gravity": {
			"multiplier": 2
		},
		"move": {
			"ground": {
				"speed": 6,
				"acceleration": 0.5
			},
			"air": {
				"speed": 5,
				"acceleration": 0.5
			}
		}
	},
	"ability": {
		"jump": {
			"has_cooldown": false,
			"max_uses_count": 1,

			"velocity": 15
		},
		"air_jump": {
			"has_cooldown": false,
			"max_uses_count": 1,

			"velocity": 15
		},
		"dash": {
			"has_cooldown": true,
			"cooldown_time": 2.0,
			"max_uses_count": 1,

			"time": 0.2,
			"speed": 30,
			"acceleration": 0.5
		}
	}
}

