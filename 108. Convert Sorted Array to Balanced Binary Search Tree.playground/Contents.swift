/**
 Question:
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 Hint:
 This question is highly recursive in nature. Think of how binary search works.
 
 Link: https://oj.leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(nums, 0, nums.count - 1)
    }
    
    private func sortedArrayToBST(_ arr: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let mid = (start + end) / 2
        let node = TreeNode(arr[mid])
        node.left = sortedArrayToBST(arr, start, mid-1)
        node.right = sortedArrayToBST(arr, mid+1, end)
        return node
    }
}