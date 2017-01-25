/**
 Question:
 Follow up for "Find Minimum in Rotated Sorted Array":
 What if duplicates are allowed?
 Would this affect the run-time complexity? How and why?
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 Find the minimum element.
 The array may contain duplicates.
 
 Link: https://oj.leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
 */

import Foundation

/**
 For case where Al == Am == Ar, the minimum could be on Am’s left or right side (eg, [1, 1, 1, 0, 1] or [1, 0, 1, 1, 1]). In this case, we could not discard either subarrays and therefore such worst case degenerates to the order of O(n).
 */
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r && nums[l] >= nums[r] {
            let m = (l + r) / 2
            if nums[m] > nums[r] {
                l = m + 1
            } else if nums[m] < nums[l] {
                r = m
            } else { // nums[l] == nums[m] == nums[r]
                l = l + 1
            }
        }
        return nums[l]
    }
}

let obj = Solution()
let a1 = [1, 1, 1, 0, 1]
let a2 = [2, 2, 3, 5, 9, 0, 0, 1]
obj.findMin(a1)
obj.findMin(a2)
