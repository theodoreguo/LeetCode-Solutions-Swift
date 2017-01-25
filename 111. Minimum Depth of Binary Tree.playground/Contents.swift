/**
 Question:
 Given a binary tree, find its minimum depth.
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 Similar to Question [26. Maximum Depth of Binary Tree], here we need to find the minimum depth instead.
 
 Link: https://oj.leetcode.com/problems/minimum-depth-of-binary-tree/
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

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        if root!.left == nil {
            return minDepth(root!.right) + 1
        }
        if root!.right == nil {
            return minDepth(root!.left) + 1
        }
        return min(minDepth(root!.left), minDepth(root!.right)) + 1
    }
}