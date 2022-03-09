// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/546/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 2 { return [0, 1] }
        
        var histogram = Dictionary<Int, Int>(minimumCapacity: nums.count)
        for i in 0..<nums.count {
            histogram[nums[i] - target] = i
        }
        
        for i in 0..<nums.count {
            let i2 = histogram[-nums[i]]
            if i2 == nil || i2 == i { continue }
            return [i, i2!]
        }
        
        return []
    }
}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 2 { return [0, 1] }
        
        var histogram = Dictionary<Int, Int>(minimumCapacity: nums.count)
        for i in 0..<nums.count {
            if let i2 = histogram[-nums[i]] {
                return [i, i2]
            }
            histogram[nums[i] - target] = i
        }
        
        return []
    }
}
