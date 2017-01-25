/**
 Question:
 Given an array of integers, every element appears three times except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Link: https://oj.leetcode.com/problems/single-number-ii/
 */

import Foundation

/**
 Count how many 1s are there in each bit out of all 64 bits, and sum %= 3 will clear it once it reaches 3. After running for all the numbers for each bit, if we have a 1, then that 1 belongs to the single number, we can simply move it back to its spot by doing ans |= sum << i.
 
 It has complexity of O(32n), which is essentially O(n). In addition, it can be a general solution for any times of occurrence. For instance, use sum %= k if all the numbers have k times.
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ans = 0
        for i in 0..<64 {
            var sum = 0
            for j in 0..<nums.count {
                if(((nums[j] >> i) & 1) == 1) {
                    sum += 1
                    sum %= 3
                }
            }
            if sum != 0 {
                ans |= sum << i
            }
        }
        return ans
    }
}

/**
 The general version of the question would be:
 Given an array of integers, every element appears k times except for one. Find that single one who appears l times.
 
 We need a array x[i] with size k for saving the bits appears i times.
 For every input number a, generate the new counter by x[j] = (x[j-1] & a) | (x[j] & ~a).
 Except x[0] = (x[k] & a) | (x[0] & ~a).
 
 In the equation, the first part indicates the the carries from previous one.
 The second part indicates the bits not carried to next one.
 
 Then the algorithms run in O(kn) and the extra space O(k).
 
 Refer to Solution3 for the implementation.
 */
class Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        var x0 = ~0, x1 = 0, x2 = 0
        var t: Int?
        for i in 0..<nums.count {
            t = x2
            x2 = (x1 & nums[i]) | (x2 & ~nums[i])
            x1 = (x0 & nums[i]) | (x1 & ~nums[i])
            x0 = (t! & nums[i]) | (x0 & ~nums[i])
        }
        return x1;
    }
}

class Solution3 {
    public func singleNumber(_ nums: [Int], _ k: Int, _ l: Int) -> Int {
        var t: Int?
        var x = [Int](repeating: 0, count: k)
        x[0] = ~0
        for i in 0..<nums.count {
            t = x[k-1]
            var j = k-1
            while j > 0 {
                x[j] = (x[j-1] & nums[i]) | (x[j] & ~nums[i])
                j -= 1
            }
            x[0] = (t! & nums[i]) | (x[0] & ~nums[i])
        }
        return x[l]
    }
}

let obj = Solution()
let obj2 = Solution2()
let obj3 = Solution3()
let a1 = [2, 2, 6, 4, 4, 5, 6, 6, 2, 4]
let a2 = [-2, -2, 1, 1, -3, 1, -3, -3, -4, -2]
obj.singleNumber(a1)
obj.singleNumber(a2)
obj2.singleNumber(a1)
obj2.singleNumber(a2)
obj3.singleNumber(a1, 3, 1)
obj3.singleNumber(a2, 3, 1)