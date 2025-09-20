class_name HurtComponent
extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.None

signal hurt

func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	if tool == hit_component.current_tool:
		print("Acertou árvore com ferramenta correta!")
		hurt.emit(hit_component.hit_damage)
	else:
		print("Ferramenta incorreta!")
