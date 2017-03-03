/**
 Question:
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 For example,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3.
 
 Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
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

class Solution {
    /**
     Iterate the list, jump over duplicates by replacing next with next.next
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        var node = dummy
        
        while node.next != nil && node.next!.next != nil {
            if node.next!.val == node.next!.next!.val {
                let val = node.next!.val
                while node.next != nil && node.next!.val == val {
                    node.next = node.next!.next
                }
            } else {
                node = node.next!
            }
        }
        
        return dummy.next
    }
    
    /**
     Use two pointers
     slow - track the node before the dup nodes
     fast - to find the last node of dups
     
     Note: Swift provides "===" & "!==" to compare two objects refer to the same reference
     */
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        
        let dummy = ListNode(0)
        var fast = head, slow = dummy
        slow.next = fast
        
        while fast != nil {
            while fast?.next != nil && fast?.val == fast?.next?.val {
                fast = fast?.next // while loop to find the last node of the dups
            }
            
            if slow.next !== fast { // Duplicates detected
                slow.next = fast?.next // Remove the dups
                fast = slow.next // Reposition the fast pointer
            } else { // No dup, move down both pointers
                slow = slow.next!
                fast = fast?.next
            }
        }
        
        return dummy.next
    }
}
