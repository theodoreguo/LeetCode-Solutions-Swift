/**
 Question:
 Implement strsStr().
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Link: https://oj.leetcode.com/problems/implement-strstr/
 */

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack.characters)
        let nChars = Array(needle.characters)
        
        for i in 0...hChars.count {
            for j in 0...nChars.count {
                if j == nChars.count {
                    return i
                }
                if i + j == hChars.count {
                    return -1
                }
                if (nChars[j] != hChars[i + j]) {
                    break
                }
            }
        }
        return -1
    }
}

let obj = Solution()
let haystack = "mississippi"
let needle = "issi"
obj.strStr(haystack, needle)
