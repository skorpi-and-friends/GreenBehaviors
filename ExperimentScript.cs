using System;
using Godot;

public class ExperimentScript : Node {

	// Called when the node enters the scene tree for the first time.
	public override void _Ready() {
		var scene = GD.Load<PackedScene>("res://addons/green_behaviors/editor/scenes/main_screen_editor.tscn");
		GD.Print(scene.Instance().GetType());
		var someScript = (BehaviorTreeEditor) scene.Instance();
		GD.Print(someScript != null);
	}
}
