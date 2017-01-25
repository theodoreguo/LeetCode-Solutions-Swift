/**
 Question:
 Given a binary tree, determine if it is height-balanced.
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differs by more than 1.
 
 Link: https://oj.leetcode.com/problems/balanced-binary-tree/
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return abs(maxDepth(root!.left) - maxDepth(root!.right)) <= 1
            && isBalanced(root!.left)
            && isBalanced(root!.right)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
    }
}