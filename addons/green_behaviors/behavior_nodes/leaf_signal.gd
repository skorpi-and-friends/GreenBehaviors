extends BehaviorNode

"""
A base class for the leaf behavior tree nodes i.e. nodes that contain
the actual behavior that make use of delegates. 
"""

class_name LeafSignalNode

signal start_signal(node);
signal finish_signal(node, state);
signal cancel_signal(node);
signal reset_signal(node);


func _init(node_name: String).(node_name):
	pass


func _tick() -> int:
	return NodeState.FAILURE

func start() -> void:
	emit_signal("start_signal", self);
	.start();

func finish(state: int) -> void:
	emit_signal("finish_signal", self);
	.finish(state);


func cancel() -> void:
	emit_signal("cancel_signal", self);
	.cancel();


func reset() -> void:
	emit_signal("_reset_signal", self);
	.reset();