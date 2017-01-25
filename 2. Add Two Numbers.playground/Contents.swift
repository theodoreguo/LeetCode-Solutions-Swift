/**
 Question:
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contains a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 Link: https://oj.leetcode.com/problems/add-two-numbers/
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

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, curr = dummyHead
        var carry = 0
        while p != nil || q != nil {
            let x = (p != nil) ? p!.val : 0
            let y = (q != nil) ? q!.val : 0
            let digit = carry + x + y
            carry = digit / 10
            curr.next = ListNode(digit % 10)
            curr = curr.next!
            if p != nil {
                p = p!.next
            }
            if q != nil {
                q = q!.next
            }
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        return dummyHead.next
    }
}
