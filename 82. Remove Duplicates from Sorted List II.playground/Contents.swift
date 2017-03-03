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

/**
 Iterate the list, jump over duplicates by replacing next with next.next
 */
class RemoveDuplicatesFromSortedList {
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
