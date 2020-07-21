extends LeafSignalNode

"""
A simple class that allows easy definition of a leaf node through delegates. 
"""

class_name Action

signal tick_signal(node);


func _init(node_name: String).(node_name):
	pass


func _tick() -> int:
	emit_signal("start_signal", self);
	return state;
