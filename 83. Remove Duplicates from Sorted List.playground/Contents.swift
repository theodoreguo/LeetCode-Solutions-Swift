/**
 Question:
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 
 Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 */

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
 Iterate the list, jump over duplicates by replacing next with next.next
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var curr = head
        
        while curr.next != nil {
            if curr.next!.val == curr.val {
                curr.next = curr.next!.next
            } else {
                curr = curr.next!
            }
        }
        
        return head
    }
}
