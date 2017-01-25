/**
 Question:
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 
 Example Questions Candidate Might Ask:
 Q: Is the empty string valid? 
 A: Yes.
 
 Link: https://oj.leetcode.com/problems/valid-parentheses/
 */

import Foundation

/**
 To validate the parentheses, we need to match each closing parenthesis with its opening counterpart. A Last-In-First-Out (LIFO) data structure such as stack is the perfect fit.
 As we see an opening parenthesis, we push it onto the stack. On the other hand, when we encounter a closing parenthesis, we pop the last inserted opening parenthesis from the stack and check if the pair is a valid match.
 Using dictionary is a maintainable way when matching parentheses.
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s.characters {
            if dict[char] != nil {
                stack.append(char)
            } else if stack.isEmpty || dict[stack.removeLast()] != char {
                return false
            }
        }
        return stack.isEmpty
    }
    
    private let dict: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
}

let obj = Solution()
let s1 = "()[]{}"
let s2 = "{)"
let s3 = "][()"
obj.isValid(s1)
obj.isValid(s2)
obj.isValid(s3)
