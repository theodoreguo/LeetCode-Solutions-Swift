/**
 Given a non-empty array of integers, return the k most frequent elements.
 
 For example,
 Given [1, 1, 1, 2, 2, 3] and k = 2, return [1, 2].
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 
 Link: https://leetcode.com/problems/top-k-frequent-elements
 */

class Solution {
    // Use a map to track frenquency of each number, then sort keys based on values using bucket sort
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var bucket = Array(repeating: Array(repeating: 0, count: 0), count: nums.count + 1)
        var frequencyMap = [Int: Int]()
        
        for num in nums {
            guard let times = frequencyMap[num] else {
                frequencyMap[num] = 1
                continue
            }
            frequencyMap[num] = times + 1
        }
        
        // Store key as bucket array element at certain index equivalent to its frequency
        for key in frequencyMap.keys {
            let frequency = frequencyMap[key]
            if bucket[frequency!].isEmpty {
                bucket[frequency!] = Array()
            }
            bucket[frequency!].append(key)
        }
        
        var res = [Int]()
        var pos = bucket.count - 1
        
        // Traverse bucket array reversely to fetch k elements stored in array by frequency
        while pos >= 0 && res.count < k {
            if !bucket[pos].isEmpty {
                res.append(contentsOf: bucket[pos])
            }
            pos -= 1
        }
        
        return res
    }
    
    // Use a map to track frenquency of each number, then sort keys based on values using sort()
    func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int: Int]()
        
        for num in nums {
            guard let times = map[num] else {
                map[num] = 1
                continue
            }
            map[num] = times + 1
        }
        
        var keys = Array(map.keys)
        
        // Sort keys array based on elements' values (i.e., frequency)
        keys.sort() {
            let value1 = map[$0]
            let value2 = map[$1]
            return value1! > value2!
        }
        
        return Array(keys[0 ..< k])
    }
}

let obj = Solution()
let a = [1]
let a2 = [1, 1, 1, 2, 2, 3]
obj.topKFrequent(a, 1)
obj.topKFrequent2(a, 1)
obj.topKFrequent(a2, 2)
obj.topKFrequent2(a2, 2)
