/**
 Question:
 Given a matrix of m ✕ n elements (m rows, n columns), return all elements of the matrix in spiral order.
 For example, given the following matrix:
 [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
 ]
 You should return [1, 2, 3, 6, 9, 8, 7, 4, 5].
 
 Link: https://oj.leetcode.com/problems/spiral-matrix/
 */

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var elements = [Int]()
        if matrix.count == 0 {
            return elements
        }
        var m = matrix.count, n = matrix[0].count
        var row = 0, col = -1
        while true {
            for _ in 0..<n {
                col += 1
                elements.append(matrix[row][col])
            }
            m -= 1
            if m == 0 {
                break
            }
            
            for _ in 0..<m {
                row += 1
                elements.append(matrix[row][col])
            }
            n -= 1
            if n == 0 {
                break
            }
            
            for _ in 0..<n {
                col -= 1
                elements.append(matrix[row][col])
            }
            m -= 1
            if m == 0 {
                break
            }
            
            for _ in 0..<m {
                row -= 1
                elements.append(matrix[row][col])
            }
            n -= 1
            if n == 0 {
                break
            }
        }
        return elements
    }
}

let obj = Solution()
let a1 = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
         ]
let a2 = [
            [ 1, 2, 3, 5],
            [ 4, 5, 6, -4],
            [ 7, 8, 9, 8]
         ]
obj.spiralOrder(a1)
obj.spiralOrder(a2)
