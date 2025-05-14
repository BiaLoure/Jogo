extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D 


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	
	if player.player_direction == Vector2.UP:
		animation_player.play("idle_up")
	elif player.player_direction == Vector2.DOWN:
		animation_player.play("idle_down")
	elif player.player_direction == Vector2.LEFT:
		animation_player.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animation_player.play("idle_right")
	else:
		animation_player.play("idle_down")

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movent_input():
		transition.emit("Walk")
		
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")
		
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
		
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animation_player.stop()
