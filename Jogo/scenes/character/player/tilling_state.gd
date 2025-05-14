extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D 

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animation_player.play("tilling_up")
	elif player.player_direction == Vector2.DOWN:
		animation_player.play("tilling_down")
	elif player.player_direction == Vector2.LEFT:
		animation_player.play("tilling_left")
	elif player.player_direction == Vector2.RIGHT:
		animation_player.play("tilling_right")
	else:
		animation_player.play("tilling_down")
		


func _on_exit() -> void:
	animation_player.stop()
