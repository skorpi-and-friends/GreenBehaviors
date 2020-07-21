extends VBoxContainer

class_name TreeBoard

var tree: BehaviorNode;

onready var _board := $Board as GraphEdit;

func add_node(node: BehaviorNode):
	var scene: PackedScene;
	if node is BehaviorNode:
		scene = load(
		"res://addons/green_behaviors/editor/scenes/nodes/BehaviorNode.tscn") as PackedScene;
	_board.add_child(scene.instance())
	