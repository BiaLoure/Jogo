extends Area2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		call_deferred("change_level")

func change_level() -> void:
	TransicaoCenas.from_world =  get_parent().name
	get_tree().change_scene_to_file("res://scenes/maps/" + name + ".tscn")
