using System;
using Godot;
using GreenBehaviors;

public class BehaviorTreeEditor : VBoxContainer {

	public BehaviorTree Tree { get; set; }

	private GraphEdit _board;

	public BehaviorTreeEditor() {
		GD.Print("got here alright");
	}

	public override void _EnterTree() {
		PrintTreePretty();
	}

	public override void _Ready() {
		PrintTreePretty();
		_board = GetNode<GraphEdit>("Board");
	}

	public void AddBehaviorNode(GreenBehaviors.Node node) {
		PackedScene scene;
		if (node is GreenBehaviors.Decorator.Inverter)
			scene = GD.Load<PackedScene>("res://addons/green_behaviors/editor/scenes/nodes/BehaviorNode.tscn");
		else
			scene = GD.Load<PackedScene>("res://addons/green_behaviors/editor/scenes/nodes/BehaviorNode.tscn");

		var graphNode = (Control) scene.Instance();
		_board.AddChild(graphNode);
	}
}
