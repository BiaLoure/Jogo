class_name SaveDataComponent
extends Node

@onready var parent_node: Node2D = get_parent() as Node2D
@export var save_data_resource: NodeDataResource   

func _ready():
	add_to_group("save_data_component")
	
func load_data():
	if save_data_resource:
		save_data_resource._load_data(parent_node)

func _save_data() -> NodeDataResource:
	if parent_node == null:
		return null
	
	if save_data_resource == null:
		save_data_resource = NodeDataResource.new()
		push_warning("save_data_resource estava vazio em %s, criando novo automaticamente." % parent_node.name)
	
	save_data_resource._save_data(parent_node)
	return save_data_resource
