extends Node3D

@export var bullet: PackedScene 

# indicates if it is possible to fire
var _isFireEnebled : bool = true

func _input(_event) -> void:
	# If the character is moving
	if owner.get_movementComponent().get_isMoving():
		
		# Firing
		if Input.is_action_pressed("fire") and _isFireEnebled:
			# Instantiate a bullet
			var _bullet = bullet.instantiate()
			_bullet.position = global_position
			_bullet.get_movementComponent().direction =  -owner.get_armature().get_global_transform().basis.z
			get_tree().get_root().add_child(_bullet)
			
			# Disable the fire system until the button is released
			_isFireEnebled = false

		# When the button is released we can fire again
		if Input.is_action_just_released("fire") and not _isFireEnebled:
			_isFireEnebled = true
