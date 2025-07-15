extends Node3D

@export var bullet: PackedScene 

# indicates if it is possible to fire
var _isFireEnebled : bool = true

func _input(_event) -> void:
	# If the character is moving and not jumping nor falling is allowed to shoot
	if owner.get_movementComponent().get_isMoving() and not owner.get_movementComponent().get_isJumping() and not owner.get_movementComponent().get_isFalling():
		
		# Firing
		if Input.is_action_pressed("fire") and _isFireEnebled:
			# Instantiate a bullet
			var _bullet = bullet.instantiate()
			# Positioning the bullet. Correcting the bullet position adding an offset from pivot to position it at the exit hole of the weapon , the right way should be changing the pivot position
			_bullet.position = global_position + Vector3(-owner.get_armature().get_global_transform().basis.z.x / 2, 0.1, -owner.get_armature().get_global_transform().basis.z.z / 2)
			# Establishing the bullet direction, the speed is configured in the component
			_bullet.get_movementComponent().direction =  -owner.get_armature().get_global_transform().basis.z
			# Putting the bullet in the game
			get_tree().get_root().add_child(_bullet)
			
			# Disable the fire system until the button is released
			_isFireEnebled = false

		# When the button is released we can fire again
		if Input.is_action_just_released("fire") and not _isFireEnebled:
			_isFireEnebled = true
