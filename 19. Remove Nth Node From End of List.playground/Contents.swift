/**
 Question:
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
 
 Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
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
 A one pass solution can be done using pointers. Move one pointer fast --> n+1 places forward, to maintain a gap of n between the two pointers and then move both at the same speed. Finally, when the fast pointer reaches the end, the slow pointer will be n+1 places behind - just the right spot for it to be able to skip the next node.
 
 Since the question gives that n is valid, not too many checks have to be put in place. Otherwise, this would be necessary.
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        
        // Move fast in front so that the gap between slow and fast becomes n
        for _ in 0 ..< n {
            fast = fast!.next
        }
        
        // Move both fast and slow concurrently until fast reaches the end, maintaining the gap
        while fast!.next != nil {
            slow = slow!.next
            fast = fast!.next
        }
        
        // Skip the desired node
        slow!.next = slow!.next!.next
        
        return dummy.next
    }
}
