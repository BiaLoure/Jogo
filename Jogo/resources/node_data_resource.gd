class_name NodeDataResource
extends Resource

@export var global_position: Vector2
@export var node_path: String            # agora guarda o caminho da cena (ex: res://scenes/objects/plants/corn.tscn)
@export var parent_node_path: NodePath   # onde instanciar o nó salvo
@export var extra_data: Dictionary = {}  # dados adicionais

func _save_data(node: Node2D) -> void:
	global_position = node.global_position
	node_path = node.scene_file_path if "scene_file_path" in node else ""
	if node_path == "":
		push_warning("Nó %s não tem cena associada (salvo sem node_path)." % node.name)
	
	parent_node_path = node.get_parent().get_path() if node.get_parent() else NodePath("")
	
	extra_data.clear()
	for key in ["stage","health","is_watered"]:
		if key in node:
			extra_data[key] = node.get(key)


func _load_data(root: Node) -> void:
	var instance: Node
	if node_path == "":
		push_warning("Node sem cena, instanciando Node2D genérico.")
		instance = Node2D.new()
	else:
		var scene = load(node_path)
		if scene == null:
			push_error("Cena não encontrada: %s" % node_path)
			return
		instance = scene.instantiate()
	
	var parent_node = root.get_node_or_null(parent_node_path)
	if parent_node:
		parent_node.add_child(instance)
	else:
		root.add_child(instance)
	
	if instance is Node2D:
		instance.global_position = global_position
	
	# restaura dados extras de forma genérica
	for key in extra_data.keys():
		if key in instance:
			instance.set(key, extra_data[key])
