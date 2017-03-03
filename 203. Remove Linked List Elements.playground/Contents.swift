/**
 Question:
 Remove all elements from a linked list of integers that have value val.
 
 Example
 Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
 Return: 1 --> 2 --> 3 --> 4 --> 5
 
 Link: https://leetcode.com/problems/remove-linked-list-elements/
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return nil }
        
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var node = dummyHead
        
        while node.next != nil {
            if node.next?.val == val {
                node.next = node.next?.next
            } else {
                node = node.next!
            }
        }
        
        return dummyHead.next
    }
}
