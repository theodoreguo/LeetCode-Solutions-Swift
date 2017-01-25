/**
 Question:
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Link: https://oj.leetcode.com/problems/merge-k-sorted-lists/
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }
        var lists = lists
        var end = lists.count - 1
        while end > 0 {
            var begin = 0
            while begin < end {
                lists[begin] = mergeTwoLists(lists[begin], lists[end])
                begin += 1
                end -= 1
            }
        }
        return lists[0]
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
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
        p.next = l1 ?? l2
        return dummyHead.next
    }
}