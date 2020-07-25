tool
extends EditorPlugin

const MainScreenTabName = "Green Behaviors";

const MainEditor = preload("editor/scenes/main_screen_editor.tscn")

var _inspector_plugin:= BehaviorTreeResourceInspectorPlugin.new();
var _main_editor_instance: Control;
var _editor_interface := get_editor_interface();
#var _editor_tool_button: ToolButton;

func _enter_tree() -> void:
	_main_editor_instance = MainEditor.instance()
#	_editor_tool_button = add_control_to_bottom_panel(_main_editor_instance, "BehaviorTrees")
	_editor_interface.get_editor_viewport().add_child(_main_editor_instance)
	_main_editor_instance.anchor_right = 1;
	_main_editor_instance.anchor_bottom = 1;
	_main_editor_instance.margin_left = 0;
	_main_editor_instance.margin_bottom = 0;
	# Hide the main panel
	make_visible(false);
	add_custom_type(
			"BehaviorTree", 
			"Resource",
			BehaviorTree, 
			preload("res://icon.png"));
	
	_inspector_plugin.connect("behavior_tree_selected", self, "show_editor");
	add_inspector_plugin(_inspector_plugin);


func _exit_tree():
#	remove_control_from_bottom_panel(_main_editor_instance);
	_main_editor_instance.queue_free();
	remove_custom_type("BehaviorTree");
	
	remove_inspector_plugin(_inspector_plugin);


func has_main_screen():
	return true


func make_visible(visible):
	if visible:
		_main_editor_instance.show()
	else:
		if _main_editor_instance:
			_main_editor_instance.hide()


func get_plugin_name():
	return MainScreenTabName;


func show_editor(tree: BehaviorTree) -> void:
#	_main_editor_instance.show()
	_editor_interface.set_main_screen_editor(MainScreenTabName);
