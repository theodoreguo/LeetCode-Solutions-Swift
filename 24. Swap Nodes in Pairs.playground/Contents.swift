/**
 Question:
 Given a linked list, swap every two adjacent nodes and return its head.
 For example,
 Given 1 -> 2 -> 3 -> 4, you should return the list as 2 -> 1 -> 4 -> 3.
 Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
 
 Example Questions Candidate Might Ask:
 Q: What if the number of nodes in the linked list has only odd number of nodes? 
 A: The last node should not be swapped.
 
 Link: https://oj.leetcode.com/problems/swap-nodes-in-pairs/
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
 Let’s assume p, q, r are the current, next, and next’s next node.
 We could swap the nodes pairwise by adjusting where it’s pointing next: 
 q.next = p
 p.next = r
 The above operations transform the list from {p -> q -> r -> s} to {q -> p -> r -> s}. 
 If the next pair of nodes exists, we should remember to connect p’s next to s. 
 Therefore, we should record the current node before advancing to the next pair of nodes.
 */
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var p = head
        var prev = dummy
        while p != nil && p!.next != nil {
            let q = p!.next, r = p!.next!.next
            prev.next = q
            q!.next = p
            p!.next = r
            prev = p! // Continue to handle next pair
            p = r
        }
        return dummy.next
    }
}
