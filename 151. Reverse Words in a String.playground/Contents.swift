/**
 Question:
 Given an input string s, reverse the string word by word.
 For example, given s = "the sky is blue", return "blue is sky the".
 
 Example Questions Candidate Might Ask:
 Q: What constitutes a word?
 A: A sequence of non-space characters constitutes a word.
 Q: Does tab or newline character count as space characters?
 A: Assume the input does not contain any tabs or newline characters.
 Q: Could the input string contain leading or trailing spaces?
 A: Yes. However, your reversed string should not contain leading or trailing spaces.
 Q: How about multiple spaces between two words?
 A: Reduce them to a single space in the reversed string.
 
 Link: https://oj.leetcode.com/problems/reverse-words-in-a-string/
 */

import Foundation

class Solution {
    func reverseWordsInAString(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        
        var chars = [Character](s.characters)
        let len = chars.count
        
        // Reverse the whole string
        reverseString(&chars, 0, len)
        // Reverse each word
        reverseWords(&chars, len)
        // Trim leading, trailing and multiple spaces
        return String(chars).replacingOccurrences(of: "^\\s+|\\s+$|\\s+(?=\\s)", with: "", options: NSString.CompareOptions.regularExpression, range: nil) // ^\s+ and \s+$ match one or more white space characters at the start/end of the string. The tricky part is the \s+(?=\s) pattern, which matches one or more white space characters followed by another white space character which itself is not considered as part of the match (a "look-ahead assertion").
    }
    
    // Reverse the whole string
    private func reverseString(_ chars: inout [Character], _ start: Int, _ end: Int) {
        for i in 0..<(end - start) / 2 {
            let temp = chars[start + i]
            chars[start + i] = chars[end - i - 1]
            chars[end - i - 1] = temp
        }
    }

    // Reverse each word
    private func reverseWords(_ chars:inout Array<Character>, _ len: Int) {
        var i = 0
        for var j in 0...len {
            if j == len || chars[j] == " " {
                reverseString(&chars, i, j)
                i = j + 1
            }
            j += 1
        }
    }
}

let obj = Solution()
let s = " the  sky is   blue "
obj.reverseWordsInAString(s)
