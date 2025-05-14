extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D
@export var speed: int =100


func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		animation_player.play("walk_up")
	elif direction == Vector2.RIGHT:
		animation_player.play("walk_right")
	elif direction == Vector2.DOWN:
		animation_player.play("walk_down")
	elif direction == Vector2.LEFT:
		animation_player.play("walk_left")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()  # corrigido aqui

func _on_next_transitions() -> void:
	if not GameInputEvents.is_movent_input():  # cuidado com a lógica aqui
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animation_player.stop()
