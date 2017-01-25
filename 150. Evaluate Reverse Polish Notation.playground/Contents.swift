/**
 Question:
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.
 Valid operators are +, -, *, /. Each operand may be an integer or another expression.
 
 Some examples:
 ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
 ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
 
 Example Questions Candidate Might Ask:
 Q: Is an empty array a valid input?
 A: No.
 
 Link: https://oj.leetcode.com/problems/evaluate-reverse-polish-notation/
 */

import Foundation

/**
 Observe that every time we see an operator, we need to evaluate the last two operands. Stack fits perfectly as it is a Last-In-First-Out (LIFO) data structure.
 We evaluate the expression left-to-right and push operands onto the stack until we encounter an operator, which we pop the top two values from the stack. We then evaluate the operator, with the values as arguments and push the result back onto the stack.
 */
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if operators.contains(token) {
                let y = stack.removeLast() // Pop
                let x = stack.removeLast()
                stack.append(eval(x, y, token)) // Push
            } else {
                stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }
    
    private let operators = "+-*/"
    
    private func eval(_ x: Int, _ y: Int, _ oprt: String) -> Int {
        switch (oprt) {
        case "+": return x + y
        case "-": return x - y
        case "*": return x * y
        default:  return x / y
        }
    }
}

let obj = Solution()
let a1 = ["2", "1", "+", "3", "*"]
let a2 = ["4", "13", "5", "/", "+"]
obj.evalRPN(a1)
obj.evalRPN(a2)
