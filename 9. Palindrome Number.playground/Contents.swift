/** 
 Question:
 Determine whether an integer is a palindrome. Do this without extra space.
 
 Example Questions Candidate Might Ask:
 Q: Does negative integer such as –1 qualify as a palindrome?
 A: For the purpose of discussion here, we define negative integers as non-palindrome.
 
 Link: https://oj.leetcode.com/problems/palindrome-number/
 */

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var x = x
        guard x >= 0 else { // For non-negative integers only
            return false
        }
        var div = 1
        while x / div >= 10 { //  Getting and chopping the first digit dispose
            div *= 10
        }
        while x != 0 {
            let l = x / div
            let r = x % 10
            if l != r {
                return false
            }
            x = (x % div) / 10 // Chop off one digit from both ends
            div /= 100
        }
        return true
    }
}

let obj = Solution()
let n1 = 0
let n2 = 888
let n3 = 67876
obj.isPalindrome(n1)
obj.isPalindrome(n2)
obj.isPalindrome(n3)
