/**
 Question:
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 push(x) – Push element x onto stack.
 pop() – Removes the element on top of the stack.
 top() – Get the top element.
 getMin() – Retrieve the minimum element in the stack.
 
 Example:
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 
 Hints:
 Consider space-time tradeoff. How would you keep track of the minimums using extra space?
 Make sure to consider duplicate elements.
 
 Link: https://oj.leetcode.com/problems/min-stack/
 */

import Foundation

/**
 Swift stack definition, reference: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Stack/Stack.playground/Contents.swift
 
 public struct Stack<T> {
 fileprivate var array = [T]()
 
 public var isEmpty: Bool {
 return array.isEmpty
 }
 
 public var count: Int {
 return array.count
 }
 
 public mutating func push(_ element: T) {
 array.append(element)
 }
 
 public mutating func pop() -> T? {
 return array.popLast()
 }
 
 public var top: T? {
 return array.last
 }
 }
 */
struct Stack {
    var items = [Int]()
    public var isEmpty: Bool {
        return items.isEmpty
    }
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    var top: Int? {
        return items.last
    }
}

class MinStack {
    var stack = Stack()
    var minStack = Stack()
    
    func push(_ x: Int) {
        stack.push(x);
        if minStack.isEmpty || x <= minStack.top! {
            minStack.push(x)
        }
    }
    
    func pop() {
        if stack.pop() == minStack.top {
            minStack.pop()
        }
    }
    
    func top() -> Int? {
        return stack.top
    }
    
    func getMin() -> Int? {
        return minStack.top
    }
}

/**
 Your MinStack object will be instantiated and called as such:
 let obj = MinStack()
 obj.push(x)
 obj.pop()
 let param_1 = obj.top()
 let param_2 = obj.getMin()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
obj.top()
obj.getMin()
