/**
 Question: 
 Reverse a linked list from position m to n. Do it in-place and in one-pass.
 
 For example:
 Given 1->2->3->4->5->NULL, m = 2 and n = 4,
 
 return 1->4->3->2->5->NULL.
 
 Note:
 Given m, n satisfy the following condition:
 1 ≤ m ≤ n ≤ length of list.
 
 Link: https://leetcode.com/problems/reverse-linked-list-ii/
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil { return nil }
        
        let dummyHead = ListNode(0) // Create a dummy node to mark the head of this list
        dummyHead.next = head
        
        var prevNode = dummyHead // Make a pointer prevNode as a marker for the node before reversing
        for _ in 0 ..< m - 1 {
            prevNode = prevNode.next!
        }
        
        let currNode = prevNode.next // A pointer to the beginning of a sub-list that will be reversed
        var nextNode = currNode?.next // A pointer to a node that will be reversed
        
        // 1 - 2 - 3 - 4 - 5; m = 2; n = 4 ---> prevNode = 1, currNode = 2, nextNode = 3
        // dummy -> 1 -> 2 -> 3 -> 4 -> 5
        
        for _ in 0 ..< n - m {
            currNode?.next = nextNode?.next
            nextNode?.next = prevNode.next
            prevNode.next = nextNode
            nextNode = currNode?.next
        }
        
        // First reversing : dummy -> 1 -> 3 -> 2 -> 4 -> 5; prevNode = 1, currNode = 2, nextNode = 4
        // Second reversing: dummy -> 1 -> 4 -> 3 -> 2 -> 5; prevNode = 1, currNode = 2, nextNode = 5 (Finish)
        
        return dummyHead.next
    }
    
    func reverseBetween2(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == n { return head }
        
        var prev: ListNode? = nil // Track (m-1)th node
        let first: ListNode? = ListNode(0) // first's next points to mth
        let second: ListNode? = ListNode(0) // second's next points to (n+1)th
        
        var i = 0
        var p = head
        while p != nil {
            i += 1
            if i == m-1 {
                prev = p
            }
            
            if i == m {
                first?.next = p
            }
            
            if i == n {
                second?.next = p?.next
                p?.next = nil
            }
            
            p = p?.next
        }
        
        if first?.next == nil { return head }
        
        // Reverse list [m, n]
        var p1 = first?.next // Previous node
        var p2 = p1?.next // Current node
        p1?.next = second?.next
        
        while p2 != nil {
            let t = p2?.next // Next node
            p2?.next = p1
            p1 = p2
            p2 = t
        }
        
        // Connect to previous part
        if prev != nil {
            prev?.next = p1
        } else {
            return p1
        }
        
        return head
    }
}