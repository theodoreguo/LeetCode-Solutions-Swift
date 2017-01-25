/**
 Question:
 Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.
 
 Hint:
 First, make sure you understand what a palindrome means. A palindrome is a string which reads the same in both directions. For example, “aba” is a palindome, “abc” is not.
 
 Link: https://oj.leetcode.com/problems/longest-palindromic-substring/
 */

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = [Character](s.characters)
        var start = 0, end = 0
        for i in 0..<chars.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(chars[start ... end])
    }
    
    private func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
        let chars = [Character](s.characters)
        var i = left, j = right
        while i >= 0 && j < chars.count && chars[i] == chars[j] {
            i -= 1
            j += 1
        }
        return j - i - 1
    }
    
    func longestPalindrome2(_ s: String) -> String {
        guard s.characters.count > 1 else {
            return s
        }
        
        var sChars = [Character](s.characters)
        let len = sChars.count
        var maxLen = 1
        var maxStart = 0
        var isPalin = Array(repeating: Array(repeating: false, count : len), count : len)
        
        for i in 0 ... len - 1 {
            isPalin[i][i] = true
        }
        
        for i in 0 ... len - 2 {
            if sChars[i] == sChars[i + 1] {
                isPalin[i][i + 1] = true
                maxLen = 2
                maxStart = i
            }
        }
        
        if len >= 3 {
            for length in 3 ... len {
                for i in 0 ... len - length {
                    if sChars[i] == sChars[i + length - 1] && isPalin[i + 1][i + length - 2] {
                        isPalin[i][i + length - 1] = true
                        maxLen = length
                        maxStart = i
                    }
                }
            }
        }
        
        return String(sChars[maxStart...maxStart + maxLen - 1])
    }
}

let obj = Solution()
let s1 = "abacdgfdcaba"
let s2 = "aabaa"
let s3 = "ddgcbaabcclj"
obj.longestPalindrome(s1)
obj.longestPalindrome(s2)
obj.longestPalindrome(s3)
obj.longestPalindrome2(s1)
obj.longestPalindrome2(s2)
obj.longestPalindrome2(s3)
