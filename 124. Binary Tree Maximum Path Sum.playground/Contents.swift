/**
 Question:
 Given a binary tree, find the maximum path sum.
 
 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
 
 For example:
 Given the below binary tree,
   1
  / \
 2   3
 Return 6.
 
 Link: https://oj.leetcode.com/problems/binary-tree-maximum-path-sum/
 */

import Foundation

/**
 Definition for a binary tree node
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/**
 Anytime when you found that doing top down approach uses a lot of repeated calculation, bottom up approach usually is able to be more efficient.
           __Node__
          /        \
 left subtree    right subtree
 Try the bottom up approach. At each node, the potential maximum path could be one of these cases:
 i. max(left subtree) + node
 ii. max(right subtree) + node
 iii. max(left subtree) + max(right subtree) + node
 iv. the node itself
 Then, we need to return the maximum path sum that goes through this node and to either one of its left or right subtree to its parent. 
 There’s a little trick here: If this maximum happens to be negative, we should return 0, which means: “Do not include this subtree as part of the maximum path of the parent node”, which greatly simplifies our code.
 */
class Solution {
    private var maxSum: Int?
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxSum = Int.min
        findMax(root)
        return maxSum!
    }
    
    private func findMax(_ p: TreeNode?) -> Int {
        if p == nil {
            return 0
        }
        let left = findMax(p?.left)
        let right = findMax(p?.right)
        maxSum = max((p?.val)! + left + right, maxSum!)
        let ret = (p?.val)! + max(left, right)
        return ret > 0 ? ret : 0
    }
}
