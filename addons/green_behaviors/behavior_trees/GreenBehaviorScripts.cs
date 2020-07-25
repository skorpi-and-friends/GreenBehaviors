using System;
using Godot;

public class GreenBehaviorScripts : Godot.Object {

    public static CSharpScript BehaviorTree = GD.Load<CSharpScript>("res://addons/green_behaviors/behavior_trees/GreenBehaviors/BehaviorTree.cs");
    public static CSharpScript BehaviorNode = GD.Load<CSharpScript>("res://addons/green_behaviors/behavior_trees/GreenBehaviors/Node.cs");

    public static CSharpScript Inverter = GD.Load<CSharpScript>("res://addons/green_behaviors/behavior_trees/GreenBehaviors/decorator/Inverter.cs");

}