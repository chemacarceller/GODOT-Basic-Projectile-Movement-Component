extends StaticBody3D

func _on_basic_projectile_movement_stb__collision_taken_place(_collision : KinematicCollision3D) -> void:
	# When hitting anything it is eliminated. no further action
	queue_free()

# Getting the projectile movement
func get_movementComponent() -> BasicProjectileMovementComponent:
	return get_node("BasicProjectileMovementComponent")
