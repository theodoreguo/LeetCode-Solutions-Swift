/**
 Question:
 Find the contiguous subarray within an array (containing at least one number) that has the largest sum.
 For example, given the array [2, 1, –3, 4, –1, 2, 1, –5, 4], the contiguous array [4, –1, 2, 1] has the largest sum = 6.
 
 Link: https://oj.leetcode.com/problems/maximum-subarray/
 */

import Foundation

/**
 Dynamic programming:
 To devise a dynamic programming formula, let us assume that we are calculating the maximum sum of subarray that ends at a specific index.
 Let's denote that:
 f(k) = Maximum sum of subarray ending at index k.
 Then, f(k) = max(f(k-1) + nums[k], nums[k]).
 Using an array of size n, We could deduce the final answer by as f(n – 1), with the initial state of f(0) = A[0]. Since we only need to access its previous element at each step, two variables are sufficient.
 Notice the difference between the two: maxEndingHere and maxSoFar; the former is the maximum sum of subarray that must end at index k, while the latter is the global maximum subarray sum.
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxEndingHere = nums[0], maxSoFar = nums[0]
        for i in 1..<nums.count {
            maxEndingHere = max(maxEndingHere + nums[i], nums[i])
            maxSoFar = max(maxEndingHere, maxSoFar)
        }
        return maxSoFar
    }
}

let obj = Solution()
let a1 = [2, 1, -3, 4, -1, 2, 1, -5, 4]
let a2 = [1, 2, -1, -4, 3, 4]
obj.maxSubArray(a1)
obj.maxSubArray(a2)