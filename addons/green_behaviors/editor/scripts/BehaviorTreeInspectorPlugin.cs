using System;
using Godot;
using GreenBehaviors;

public class BehaviorTreeInspectorPlugin : Godot.EditorInspectorPlugin {
    [Signal]
    public delegate void BehaviorTreeSelected(string foo, int bar);

    public override bool CanHandle(Godot.Object @object) =>
        @object is BehaviorTree;

    public override void ParseBegin(Godot.Object @object) {
        GD.Print("got here");
        AddCustomControl(
            new SwitchToTreeEditorButton(@object as BehaviorTree, this));
    }
    public void SwitchToTreeEditor(BehaviorTree tree) {
        EmitSignal(nameof(BehaviorTreeSelected), tree);
    }

    private class SwitchToTreeEditorButton : Godot.Button {
        public SwitchToTreeEditorButton(BehaviorTree tree, BehaviorTreeInspectorPlugin plugin) {
            RectMinSize = new Vector2(50, 50);
            Text = "Show in tree editor.";

            Connect("pressed", plugin, "SwitchToTreeEditor", new Godot.Collections.Array { tree });
        }
    }
}