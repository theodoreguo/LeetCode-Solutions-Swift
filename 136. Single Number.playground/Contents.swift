/**
 Question:
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example Questions Candidate Might Ask:
 Q: Does the array contain both positive and negative integers? 
 A: Yes.
 Q: Could any element appear more than twice? 
 A: No.
 
 Link: https://oj.leetcode.com/problems/single-number/
 */

import Foundation

/**
 XOR-ing a number with itself is zero. If we XOR all numbers together, it would effectively cancel out all elements that appear twice leaving us with only the single number. 
 As the XOR operation is both commutative and associative, the order in how you XOR them does not matter.
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var num = 0
        for x in nums {
            num ^= x
        }
        return num
    }
}

let obj = Solution()
let a1 = [2, 3, 6, 4, 4, 5, 3, 6, 2]
let a2 = [0, 6, 0]
obj.singleNumber(a1)
obj.singleNumber(a2)
