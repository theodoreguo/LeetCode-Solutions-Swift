/**
 Question:
 Given a roman numeral, convert it to an integer.
 Input is guaranteed to be within the range from 1 to 3999.

 Roman literals and its decimal representations:
 Roman Literal  Decimal
      I           1
      V           5
      X           10
      L           50
      C           100
      D           500
      M           1000

 Link: https://oj.leetcode.com/problems/roman-to-integer/
 */

import Foundation

/**
 Step by step calculation of roman numeral "MXCVI":
 Roman literals from left to right  Accumulated total
 M                                  1000
 MX                                 1000 + 10 = 1010
 MXC                                1010 + (100 – 2 * 10) = 1010 + 80 = 1090
 MXCV                               1090 + 5 = 1095
 MXCVI                              1095 + 1 = 1096
 */
class Solution {
    func romanToInt(_ s: String) -> Int {
        var prev = 0, total = 0
        for c in s.characters {
            let curr = dict[c]
            total += (curr! > prev) ? (curr! - 2 * prev) : curr!
            prev = curr!
        }
        return total;
    }
    
    private let dict: Dictionary<Character, Int> = [
        "I": 1, "V": 5, "X": 10,
        "L": 50, "C": 100, "D": 500,
        "M": 1000
    ]
}

let obj = Solution()
let s1 = "MXCVI"
let s2 = "DCCCXCIX"
obj.romanToInt(s1)
obj.romanToInt(s2)
