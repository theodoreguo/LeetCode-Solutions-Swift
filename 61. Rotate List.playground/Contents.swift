/**
 Question:
 Given a list, rotate the list to the right by k places, where k is non-negative.
 
 For example:
 Given 1->2->3->4->5->NULL and k = 2,
 return 4->5->1->2->3->NULL.
 
 Link: https://leetcode.com/problems/rotate-list/
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
     Implementation using Runner Tech: use two pointers, i.e., slow and fast
     */
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return head }
        
        var slow = head
        var fast = head
        let len = getLength(head)
        var k = k % len
        
        // Move fast in front so that the gap between slow and fast becomes k
        while k > 0 {
            fast = fast!.next
            k -= 1
        }
        
        // Move both slow and fast concurrently until fast reaches the end, maintaining the gap
        while fast!.next != nil {
            slow = slow!.next
            fast = fast!.next
        }
        
        // Join the unshifted list with the head
        fast!.next = head
        fast = slow!.next
        slow!.next = nil
        
        return fast
    }
    
    private func getLength(_ head: ListNode?) -> Int {
        var len = 0
        var node = head
        
        while node != nil {
            len += 1
            node = node!.next
        }
        
        return len
    }
}
