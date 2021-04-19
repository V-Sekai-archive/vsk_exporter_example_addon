tool
extends EditorPlugin

const vsk_exporter_example_addon_const = preload("vsk_exporter_example_addon.gd")
var vsk_exporter_example_addon: Reference = null

func register_addon() -> void:
	var vsk_exporter: Node = get_node_or_null("/root/VSKExporter")
	if vsk_exporter:
		print("Registering Exporter Addon")
		vsk_exporter.get_export_addon_interface().register_exporter_addon(vsk_exporter_example_addon)

func unregister_addon() -> void:
	var vsk_exporter: Node = get_node_or_null("/root/VSKExporter")
	if vsk_exporter:
		print("Unregistering Exporter Addon")
		vsk_exporter.get_export_addon_interface().unregister_exporter_addon(vsk_exporter_example_addon)

func _notification(p_notification: int):
	match p_notification:
		NOTIFICATION_PREDELETE:
			print("Destroying VSKExporterAddonExample plugin")

func get_name() -> String:
	return "VSKExporterAddonExample"
	
func _exit_tree():
	if vsk_exporter_example_addon:
		unregister_addon()
		vsk_exporter_example_addon = null
	
func _ready():
	vsk_exporter_example_addon = vsk_exporter_example_addon_const.new()
	
	var vsk_exporter: Node = get_node_or_null("/root/VSKExporter")
	if vsk_exporter:
		register_addon()

func _init() -> void:
	print("Initialising VSKExporterAddonExample plugin")
