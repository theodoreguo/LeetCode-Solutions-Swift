/**
 Question:
 Given an integer, convert it to a roman numeral.
 Input is guaranteed to be within the range from 1 to 3999.
 
 Hint:
 What is the range of the numbers?
 
 Roman literals and its decimal representations:
 Roman Literal  Decimal
      I           1
      V           5
      X           10
      L           50
      C           100
      D           500
      M           1000
 
 Link: https://oj.leetcode.com/problems/integer-to-roman/
 */

import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        var num = num
        var roman = String()
        var i = 0
        while num > 0 {
            let k = num / values[i]
            for _ in 0..<k {
                roman.append(symbols[i])
                num -= values[i]
            }
            i += 1
        }
        return roman
    }
    
    private let values: [Int] = [
        1000, 900, 500, 400,
        100,  90,  50,  40,
        10,   9,   5,   4,
        1
    ]
    
    private let symbols: [String] = [
        "M", "CM", "D", "CD",
        "C", "XC", "L", "XL",
        "X", "IX", "V", "IV",
        "I"
    ]
}

let obj = Solution()
let n1 = 19
let n2 = 899
obj.intToRoman(n1)
obj.intToRoman(n2)
