/**
 Question:
 You are climbing a staircase. It takes n steps to reach to the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to
 the top?
 
 Note: Given n will be a positive integer.
 
 Link: https://oj.leetcode.com/problems/climbing-stairs/
 */

import Foundation

/**
 Define:
 f(n) = number of ways climbing to the nth step. 
 To reach to the nth step, only two choices available:
 1. Advance one step from the n – 1th step.
 2. Advance two steps from the n – 2th step.
 Therefore, f(n) = f(n – 1) + f(n – 2), which is the exact same recurrence formula defined by the Fibonacci sequence (with different base cases, though).
 Set base cases f(1) = 1, f(2) = 2.
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var steps = [Int](repeating: 0, count: n + 1)
        return calcWays(n, &steps)
    }
    
    private func calcWays(_ n: Int, _ steps: inout [Int]) -> Int {
        if n < 0 {
            return 0
        }
        if n == 0 {
            return 1
        }
        if steps[n] != 0 {
            return steps[n]
        }
        steps[n] = calcWays(n - 1, &steps) + calcWays(n - 2, &steps)
        return steps[n]
    }
}

let obj = Solution()
let n1 = 1
let n2 = 2
let n3 = 6
obj.climbStairs(n1)
obj.climbStairs(n2)
obj.climbStairs(n3)
