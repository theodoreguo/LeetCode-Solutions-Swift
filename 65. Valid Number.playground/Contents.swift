/**
 Question:
 Validate if a given string is numeric. Some examples:
 "0" -> true 
 "0.1" -> true 
 "abc" -> false
 
 Example Questions Candidate Might Ask:
 Difficulty: Easy, Frequency: Low
 Q: How to account for whitespaces in the string?
 A: When deciding if a string is numeric, ignore both leading and trailing whitespaces.
 Q: Should I ignore spaces in between numbers – such as “1 1”?
 A: No, only ignore leading and trailing whitespaces. “1 1” is not numeric.
 Q: If the string contains additional characters after a number, is it considered valid?
 A: No. If the string contains any non-numeric characters (excluding whitespaces and decimal point), it is not numeric.
 Q: Is it valid if a plus or minus sign appear before the number? A: Yes. “+1” and “-1” are both numeric.
 Q: Should I consider only numbers in decimal? How about numbers in other bases such as hexadecimal (0xFF)?
 A: Only consider decimal numbers. “0xFF” is not numeric.
 Q: Should I consider exponent such as “1e10” as numeric?
 A: No. But feel free to work on the challenge that takes exponent into consideration. (The Online Judge problem does take exponent into account.)
 
 Link: https://oj.leetcode.com/problems/valid-number/
 */

import Foundation

class Solution {
    func isNumber(_ s: String) -> Bool {
        var str = s.replacingOccurrences(of: "^\\s+|\\s+$", with: "", options: NSString.CompareOptions.regularExpression, range: nil) // ^\s+ and \s+$ match one or more white space characters at the start/end of the string
        let chars = Array(str.characters)
        var numberSeen = false
        var pointSeen = false
        var eSeen = false
        var numberAfterE = true
        
        for i in 0..<chars.count {
            if isDigit(chars[i]) {
                numberSeen = true
                numberAfterE = true
            } else if chars[i] == "." {
                if eSeen || pointSeen {
                    return false
                }
                pointSeen = true
            } else if(chars[i] == "e") {
                if eSeen || !numberSeen {
                    return false
                }
                numberAfterE = false
                eSeen = true
            } else if chars[i] == "-" || chars[i] == "+" {
                if i != 0 && chars[i - 1] != "e" {
                    return false
                }
            } else {
                return false
            }
        }
        return numberSeen && numberAfterE
    }

    private func isDigit(_ char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}

let obj = Solution()
let s1 = "  -0.1 "
let s2 = " +8.9"
let s3 = "2e-10"
obj.isNumber(s1)
obj.isNumber(s2)
obj.isNumber(s3)
