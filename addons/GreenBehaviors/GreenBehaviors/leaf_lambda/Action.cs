using System;

namespace GreenBehaviors.LeafLambda
{
    /// <summary>
    ///     A simple class that allows easy definition of a leaf node through delegates.
    /// </summary>
    public class Action : LambdaLeafNode
    {
        private readonly Func<Action, NodeState> _tickDelegate;

        public Action(
            string name,
            Func<Action, NodeState> tickDelegate,
            Action<LambdaLeafNode> startDelegate = null,
            Action<LambdaLeafNode, NodeState> finishDelegate = null,
            Action<LambdaLeafNode> cancelDelegate = null,
            Action<LambdaLeafNode> resetDelegate = null) :
            base(name, startDelegate, finishDelegate, cancelDelegate, resetDelegate)
        {
            _tickDelegate = tickDelegate;
        }

        public override NodeState Tick() => _tickDelegate(this);
    }
}