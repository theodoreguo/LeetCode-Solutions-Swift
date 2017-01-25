/**
 Question:
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 You may assume no duplicates in the array.
 
 Here are few examples. 
 [1, 3, 5, 6], 5 → 2
 [1, 3, 5, 6], 2 → 1
 [1, 3, 5, 6], 7 → 4
 [1, 3, 5, 6], 0 → 0
 
 Link: https://oj.leetcode.com/problems/search-insert-position/
 */

import Foundation

/**
 It's a direct application of Binary Search, as the keywords sorted and finding target can be spotted easily.
 If nums[l] is greater than target, that means we are inserting target before nums[l], so we return l. If nums[l] is less than target, that means we insert target after nums[l], so we return l + 1.
 */
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let m = (l + r) / 2
            if nums[m] < target {
                l = m + 1
            } else {
                r = m
            }
        }
        return (nums[l] < target) ? l + 1 : l
    }
}

let obj = Solution()
let a1 = [1, 3, 5, 6]
let n1 = 7
let a2 = [2, 3, 5, 9]
let n2 = 3
obj.searchInsert(a1, n1)
obj.searchInsert(a2, n2)
