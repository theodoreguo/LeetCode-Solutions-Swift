/**
 A linked list is given such that each node contains an additional random pointer that could point to any node in the list or null.
 Return a deep copy of the list.
 
 Link: https://oj.leetcode.com/problems/copy-list-with-random-pointer/
 */

import Foundation

/**
 Definition for singly-linked list with a random pointer
 */
public class RandomListNode {
    public var label: Int
    public var next: RandomListNode?, random: RandomListNode?
    public init(_ x: Int) {
        self.label = x
    }
}

/**
 If we modify the next node of the original node to point to its own copy, we can assign the random node pointers of each copy easily with the following code: node.next.random = node.random.next
 */
class Solution {
    func copyRandomList(_ head: RandomListNode?) -> RandomListNode? {
        // Create a copy of each of the original node and insert them in between two original nodes in an alternate fashion
        var p = head
        while p != nil {
            let next = p!.next
            let copy = RandomListNode(p!.label)
            p!.next = copy
            copy.next = next
            p = next
        }
        // Assign random pointer of each node copy
        p = head
        while p != nil {
            p!.next!.random = (p!.random != nil) ? p!.random!.next : nil
            p = p!.next!.next
        }
        // Restore the input to its original configuration
        p = head
        let headCopy = (p != nil) ? p!.next : nil
        while p != nil {
            let copy = p!.next
            p!.next = copy!.next
            p = p!.next
            copy!.next = (p != nil) ? p!.next : nil
        }
        return headCopy
    }
}
