/**
 Question:
 Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for “abcabcbb” is “abc”, which the length is 3. For “bbbbb” the longest substring is “b”, with the length of 1.
 
 Link: https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/
 */

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = [Character](s.characters)
        var exist = Dictionary<Character, Bool>()
        var i = 0, maxLen = 0
        for j in 0..<chars.count {
            guard exist[chars[j]] != nil else {
                exist[chars[j]] = true
                maxLen = max(j - i + 1, maxLen)
                continue
            }
            while exist[chars[j]]! {
                exist[chars[i]] = false
                i += 1
            }
            exist[chars[j]] = true
            maxLen = max(j - i + 1, maxLen)
        }
        return maxLen
    }
}

let obj = Solution()
let s1 = "abcabcbb"
let s2 = "tmmzuxt"
let s3 = "pwwkew"
obj.lengthOfLongestSubstring(s1)
obj.lengthOfLongestSubstring(s2)
obj.lengthOfLongestSubstring(s3)
