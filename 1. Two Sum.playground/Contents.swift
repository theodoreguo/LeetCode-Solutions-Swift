/**
 Question:
 Given an array of integers, find two numbers such that they add up to a specific target number.
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution.
 
 Link: https://oj.leetcode.com/problems/two-sum/
 */

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Reduce the runtime complexity of searching a value using a dictionary that maps a value to its index
        var res = [Int]()
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            let x = nums[i]
            if dict[target - x]  != nil { // The number matching the difference value has been saved in the dictionary already
                res = [dict[target - x]! + 1, i + 1]
            }
            dict[x] = i // dict.updateValue(i, forKey:x), [key, value] -> [x, i]
        }
        return res
    }
}

let obj = Solution()
let nums: [Int] = [13, 3, 5, 7, 18]
let target: Int = 8
obj.twoSum(nums, target)
