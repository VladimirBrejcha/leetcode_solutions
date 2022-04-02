// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/578/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var histogram: Dictionary<Int, Bool> = [:]
        
        for num in nums {
            if histogram[num] == nil {
                histogram[num] = true
            } else {
                return true
            }
        }
        return false
    }
}

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count == 1 { return false }
        
        var histogram: Set<Int> = []
        
        for num in nums {
            let (uniq, _) = histogram.insert(num)
            if !uniq {
                return true
            }
        }
        return false
    }
}
