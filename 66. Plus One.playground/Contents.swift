/**
 Question:
 Given a number represented as an array of digits, plus one to the number.
 
 Example Questions Candidate Might Ask:
 Q: Could the number be negative?
 A: No. Assume it is a non-negative number.
 Q: How are the digits ordered in the list? For example, is the number 12 represented by [1,2] or [2,1]?
 A: The digits are stored such that the most significant digit is at the head of the list.
 Q: Could the number contain leading zeros, such as [0,0,1]? 
 A: No.
 
 Link: https://oj.leetcode.com/problems/plus-one/
 */

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        while i >= 0 {
            let digit = digits[i]
            if digit < 9 {
                digits[i] = digit + 1
                return digits
            } else {
                digits[i] = 0
                i -= 1
            }
        }
        // Handle the edge case where each digit of the number is 9
        digits.append(0)
        digits[0] = 1
        return digits
    }
}

let obj = Solution()
let a1 = [9, 9, 9, 9, 9]
let a2 = [1, 0, 0]
let a3 = [8, 7, 5]
obj.plusOne(a1)
obj.plusOne(a2)
obj.plusOne(a3)
