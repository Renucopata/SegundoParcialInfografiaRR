extends "res://src/Actors/Actor.gd"


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

func _on_playerStompDetector_body_entered(body: PhysicsBody2D ) -> void:
	if body.global_position.y > get_node("playerStompDetector").global_position.y:
		return #Stops the function
	get_node("CollisionShape2D").disabled = true
	queue_free() #Kill the enemy

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y



