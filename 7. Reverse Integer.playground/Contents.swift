/**
 Question:
 Reverse digits of an integer. For example: x = 123, return 321. 
 
 Example Questions Candidate Might Ask:
 Q: What about negative integers?
 A: For input x = –123, you should return –321.
 Q: What if the integer’s last digit is 0? For example, x = 10, 100, ...
 A: Ignore the leading 0 digits of the reversed integer. 10 and 100 are both reversed as 1.
 Q: What if the reversed integer overflows? For example, input x = 1000000003. A: In this case, your function should return 0.
 
 Link: https://oj.leetcode.com/problems/reverse-integer/
 */

import Foundation

class Solution {
    func reverseInteger(_ x: Int) -> Int {
        var n = x
        var res = 0
        while n != 0 {
            // Handle overflow/underflow
            if abs(res) > 214748364 {
                return 0
            }
            res = res * 10 + n % 10
            n /= 10
        }
        return res
    }
}

let obj = Solution()
let n1 = 1244343
let n2 = 100
let n3 = -8907
obj.reverseInteger(n1)
obj.reverseInteger(n2)
obj.reverseInteger(n3)
