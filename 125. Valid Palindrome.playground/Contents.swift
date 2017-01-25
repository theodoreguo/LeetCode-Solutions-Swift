/**
 Question:
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 For example,
 "A man, a plan, a canal: Panama" is a palindrome. "race a car" is not a palindrome.
 Example Questions Candidate Might Ask:
 Q: What about an empty string? Is it a valid palindrome?
 A: For the purpose of this problem, we define empty string as valid palindrome.
 
 Link: https://oj.leetcode.com/problems/valid-palindrome/
 */

import Foundation

class Solution {
    func isPalindrome (_ s: String) -> Bool {
        let chars = Array(s.lowercased().characters)
        var i = 0
        var j = chars.count - 1
        
        while i < j {
            while i < j && !isAlphanumeric(chars[i]) {
                i += 1
            }
            while i < j && !isAlphanumeric(chars[j]) {
                j -= 1
            }
            if chars[i] != chars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    private func isAlphanumeric(_ char: Character) -> Bool {
        guard let char = String(char).unicodeScalars.first else {
            fatalError("Character is invalid") // return !String(char).isEmpty && String(char).range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
        }
        return CharacterSet.alphanumerics.contains(char)
    }
}

let obj = Solution()
let s1 = "A man, a plan, a canal: Panama"
let s2 = "race a car"
let s3 = ""
obj.isPalindrome(s1)
obj.isPalindrome(s2)
obj.isPalindrome(s3)
