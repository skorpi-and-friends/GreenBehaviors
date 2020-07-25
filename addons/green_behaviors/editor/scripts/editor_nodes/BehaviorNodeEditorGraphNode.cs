using System;
using Godot;
using GreenBehaviors;

#if TOOLS
[Tool]
public abstract class BehaviorNodeEditorGraphNode : GraphNode
{
    public BehaviorTree Tree { get; set; }

    private LineEdit _nameEditor;

    public override void _Ready()
    {
        _nameEditor = (LineEdit)FindNode("Name");
        _nameEditor.Text = GetBehaviorNodeName();
        _nameEditor.GrabFocus();
    }

    public abstract void SetBehaviorNode(GreenBehaviors.Node node);
    protected abstract string GetBehaviorNodeName();

}
#endif