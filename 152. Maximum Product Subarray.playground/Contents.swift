/**
 Question:
 Find the contiguous subarray within an array of integers that has the largest product. For example, given the array [2,3,-2,4], the contiguous subarray [2,3] has the largest product = 6.
 
 Example Questions Candidate Might Ask:
 Q: Could the subarray be empty?
 A: No, the subarray must contain at least one number.
 
 Link: https://oj.leetcode.com/problems/maximum-product-subarray/
 */

import Foundation

/**
 Dynamic programming:
 This problem is very similar to Q151.
 Besides keeping track of the largest product, we also need to keep track of the smallest product since the smallest product which is the largest in the negative sense could become the maximum when being multiplied by a negative number.
 Let us denote that:
 f(k) = Largest product subarray, from index 0 up to k.
 Similarly,
 g(k) = Smallest product subarray, from index 0 up to k.
 Then,
 f(k) = max(f(k-1) * nums[k], nums[k], g(k-1) * nums[k]),
 g(k) = min(g(k-1) * nums[k], nums[k], f(k-1) * nums[k]).
 There we have a dynamic programming formula. Using two arrays of size n, we could deduce the final answer as f(n-1). Since we only need to access its previous elements at each step, two variables are sufficient.
 */
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var maxProduct = nums[0], minProduct = nums[0], maxAns = nums[0]
        for i in 1..<nums.count {
            let mx = maxProduct, mn = minProduct
            maxProduct = max(max(nums[i], mx * nums[i]), mn * nums[i])
            minProduct = min(min(nums[i], mx * nums[i]), mn * nums[i])
            maxAns = max(maxProduct, maxAns)
        }
        return maxAns
    }
}

let obj = Solution()
let a1 = [2, 3, -2, 4]
let a2 = [1, 2, -1, -4, -3, 4]
obj.maxProduct(a1)
obj.maxProduct(a2)
