/**
 Question:
 Similar to Question [62. Unique Paths], but now consider if some obstacles are added to the grids. How many unique paths would there be?
 An obstacle and empty space are marked as 1 and 0 respectively in the grid. For example,
 There is one obstacle in the middle of a 3×3 grid as illustrated below.
 [
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0]
 ]
 The total number of unique paths is 2.
 
 Note: m and n will be at most 100.
 
 Link: https://oj.leetcode.com/problems/unique-paths-ii/
 */

import Foundation

/**
 Extend from the Bottom-up DP approach in Q43. Just set the total paths to 0 when you encounter an obstacle.
 */
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        if m == 0 {
            return 0
        }
        let n = obstacleGrid[0].count
        var mat = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        mat[m - 1][n] = 1
        var r = m - 1
        while r >= 0 {
            var c = n - 1
            while c >= 0 {
                mat[r][c] = (obstacleGrid[r][c] == 1) ? 0 : mat[r][c+1] + mat[r+1][c]
                c -= 1
            }
            r -= 1
        }
        return mat[0][0]
    }
}

let obj = Solution()
let a1 = [
            [0, 0, 0],
            [0, 1, 0],
            [0, 0, 0]
         ]
let a2 = [
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0],
            [1, 0, 1, 0, 0]
         ]
obj.uniquePathsWithObstacles(a1)
obj.uniquePathsWithObstacles(a2)
