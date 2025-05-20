extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0);

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animation_player.play("chopping_up")
		hit_component_collision_shape.position = Vector2(0,-18)
	elif player.player_direction == Vector2.DOWN:
		animation_player.play("chopping_down")
		hit_component_collision_shape.position = Vector2(0,3)
	elif player.player_direction == Vector2.LEFT:
		animation_player.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-9,0)
	elif player.player_direction == Vector2.RIGHT:
		animation_player.play("chopping_right")
		hit_component_collision_shape.position = Vector2(9,0)
	else:
		animation_player.play("chopping_down")
	
	hit_component_collision_shape.disabled = false


func _on_exit() -> void:
	animation_player.stop()
	hit_component_collision_shape.disabled = true
