/**
 Reverse a singly linked list.
 
 Hint:
 A linked list can be reversed either iteratively or recursively.
 
 Link: https://leetcode.com/problems/reverse-linked-list/?tab=Description
 
 Reference: http://algorithms.tutorialhorizon.com/reverse-a-linked-list/
            http://www.programcreek.com/2014/05/leetcode-reverse-linked-list-java/
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
     Iterative Approach
     */
    func reverseListIterative(_ head: ListNode?) -> ListNode? {
        /*
         var head = head
         var currNode = head
         var prevNode: ListNode? = nil
         var nextNode: ListNode? = nil
         
         while currNode != nil {
            nextNode = currNode?.next
            currNode?.next = prevNode
            prevNode = currNode
            currNode = nextNode
         }
         head = prevNode ?? nil
         
         return head
         */
        
        let head = head
        
        if head == nil || head?.next == nil { return head }
        
        var p1: ListNode? = head
        var p2: ListNode? = p1?.next
        head?.next = nil
        
        while p1 != nil && p2 != nil {
            let t = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = t
        }
        
        return p1
    }
    
    /**
     Recur­sive Approach
     */
    func reverseListRecursive(_ head: ListNode?) -> ListNode? {
        let head = head
        
        if head == nil || head?.next == nil { return head }
        
        // Get second node
        let second: ListNode? = head?.next
        
        // Set first's next to be nil
        head?.next = nil
        
        let rest: ListNode? = reverseListRecursive(second)
        second?.next = head
        
        return rest
    }
}