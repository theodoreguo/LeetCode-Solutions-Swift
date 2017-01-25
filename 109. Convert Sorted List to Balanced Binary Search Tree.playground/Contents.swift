/**
 Question:
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 
 Hint:
 Things get a little more complicated when you have a singly linked list instead of an array. Please note that in linked list, you no longer have random access to an element in O(1) time.
 How about inserting nodes following the list’s order? If we can achieve this, we no longer need to find the middle element, as we are able to traverse the list while inserting nodes to the tree.
 
 Link: https://oj.leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
 */

import Foundation

/**
 Definition for singly-linked list
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
 It's recursive BST construction using slow-fast traversal on the linked list to get the middle element and make that the root. Left side of the list forms left sub-tree and right side of the middle element forms the right sub-tree.
 */
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        var head = head
        var fast = head
        var slow = head
        var prev: ListNode? = nil
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            prev = slow
            slow = slow!.next
        }
        let root = TreeNode(slow!.val)
        if prev != nil {
            prev?.next = nil
        } else {
            head = nil
        }
        root.left = sortedListToBST(head)
        root.right = sortedListToBST(slow!.next)
        return root
    }
}

/**
 O(n) runtime, O(log n) stack space – Bottom-up recursion
 */
class Solution2 {
    private var list: ListNode?
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        var n = 0
        var p = head
        while p != nil {
            p = p!.next
            n += 1
        }
        list = head!
        return sortedListToBST(0, n - 1)
    }
    
    private func sortedListToBST(_ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else {
            return nil
        }
        let mid = (start + end) / 2
        let leftChild = sortedListToBST(start, mid - 1)
        let parent = TreeNode(list!.val)
        parent.left = leftChild
        list = list!.next
        parent.right = sortedListToBST(mid + 1, end)
        return parent
    }
}
