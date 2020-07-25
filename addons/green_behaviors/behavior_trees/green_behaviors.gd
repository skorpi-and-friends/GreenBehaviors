class_name GreenBehaviors

"""
Defines constants to allow referencing of C#
classes/scripts without having to use load like
the class_name feature of gdscript.s
"""

const BehaviorTree: CSharpScript = preload("res://addons/green_behaviors/behavior_trees/GreenBehaviors/BehaviorTree.cs");
const BehaviorNode: CSharpScript = preload("res://addons/green_behaviors/behavior_trees/GreenBehaviors/Node.cs");

const Inverter: CSharpScript = preload("res://addons/green_behaviors/behavior_trees/GreenBehaviors/decorator/Inverter.cs")
