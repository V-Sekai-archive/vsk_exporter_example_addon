tool
extends "res://addons/vsk_importer_exporter/vsk_exporter_addon.gd"

func preprocess_scene(p_node: Node, p_validator: Reference) -> Node:
	print("Example Preprocess")
	return p_node

func get_name() -> String:
	return "ExampleAddon"
