/**
 Question:
 Given a binary tree, determine if it is a valid Binary Search Tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 Example 1:
   2
  / \
 1   3
 Binary tree [2,1,3], return true.
 Example 2:
   1
  / \
 2   3
 Binary tree [1,2,3], return false.
 
 Link: https://oj.leetcode.com/problems/validate-binary-search-tree/
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return valid(root, nil, nil)
    }
    
    private func valid(_ p: TreeNode?, _ low: Int?, _ high: Int?) -> Bool {
        guard let p = p else {
            return true
        }
        let low = low, high = high
        return (low == nil || p.val > low!) && (high == nil || p.val < high!)
            && valid(p.left, low, p.val)
            && valid(p.right, p.val, high)
    }
}

