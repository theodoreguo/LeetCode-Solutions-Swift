/**
 Question:
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Link: https://oj.leetcode.com/problems/merge-two-sorted-lists/
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

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        // Insert a dummy head before the new list to avoid initializing the new list’s head, etc. Then the new list’s head could just easily be returned as dummy head’s next node.
        let dummyHead = ListNode.init(0)
        var p = dummyHead
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                p.next = l1
                l1 = l1!.next
            } else {
                p.next = l2!
                l2 = l2!.next
            }
            p = p.next!
        }
        if l1 != nil { // i.e., p.next = l1 ?? l2
            p.next = l1
        }
        if l2 != nil {
            p.next = l2
        }
        return dummyHead.next
    }
}
