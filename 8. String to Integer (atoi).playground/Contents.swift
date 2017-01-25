/**
 Question:
 Implement atoi to convert a string to an integer.
 The atoi function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, the maximum integer value (2147483647) or the minimum integer value (–2147483648) is returned.
 
 Link: https://oj.leetcode.com/problems/string-to-integer-atoi/
 */

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        var res = 0
        var sign = 1
        var index = 0
        let content = Array(str.characters)
        let intMax = 2147483647
        let intMin = -2147483648
        
        // Trim spaces
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        guard index < content.count else {
            return res
        }
        
        // Sign dispose
        if content[index] == "-" {
            sign = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        // Boundary value handling
        while index < content.count {
            guard isDigit(content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
            
            if res >= intMax {
                if sign == 1 {
                    return intMax
                } else if res > intMax && sign == -1 {
                    return intMin
                }
            }
            
            index += 1
        }
        
        return sign * res
    }
    
    private func isDigit(_ char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}

let obj = Solution()
let s1 = " -3647804 790 9"
let s2 = "race a car7"
let s3 = "64rd9"
obj.myAtoi(s1)
obj.myAtoi(s2)
obj.myAtoi(s3)
