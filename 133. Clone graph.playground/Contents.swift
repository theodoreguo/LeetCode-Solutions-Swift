/**
 Question:
 Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
 
 OJ's undirected graph serialization:
 Nodes are labeled uniquely.
 
 We use # as a separator for each node, and , as a separator for node label and each neighbor of the node.
 As an example, consider the serialized graph {0,1,2#1,2#2,2}.
 
 The graph has a total of three nodes, and therefore contains three parts as separated by #.
 
 First node is labeled as 0. Connect node 0 to both nodes 1 and 2.
 Second node is labeled as 1. Connect node 1 to node 2.
 Third node is labeled as 2. Connect node 2 to node 2 (itself), thus forming a self-cycle.
 Visually, the graph looks like the following:
    1
   / \
  /   \
 0 --- 2
      / \
      \_/
 
 Link: https://oj.leetcode.com/problems/clone-graph/
 */

import Foundation

/**
 Definition for undirected graph
 */
public class UndirectedGraphNode : Hashable {
    public var label: Int
    public var neighbors: Array<UndirectedGraphNode?>?
    public init(_ x: Int) {
        self.label = x
        self.neighbors = nil
    }
    
    // MARK: Hashable
    public var hashValue: Int {
        get {
            return "\(self.label), \(self.neighbors)".hashValue
        }
    }
}

// MARK: Equatable
public func ==(lhs: UndirectedGraphNode, rhs: UndirectedGraphNode) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Solution {
    func cloneGraph(_ node: UndirectedGraphNode?) -> UndirectedGraphNode? {
        return nil
    }
    
    private func dfs(_ graph: UndirectedGraphNode?, _ dict: [UndirectedGraphNode: UndirectedGraphNode]) -> UndirectedGraphNode? {
        var dict = dict
        if dict[graph!] != nil {
            return dict[graph!]
        }
        let graphCopy = UndirectedGraphNode((graph?.label)!)
        dict[graph!] = graphCopy
        for neighbor in (graph?.neighbors!)! {
            graphCopy.neighbors!.append(dfs(neighbor, dict))
        }
        return graphCopy
    }
}