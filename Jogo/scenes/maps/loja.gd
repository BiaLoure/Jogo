extends TileMapLayer

func _ready() -> void:
	if TransicaoCenas.from_world != null:
		$Player.global_position = get_node(TransicaoCenas.from_world + "Pos").global_position
