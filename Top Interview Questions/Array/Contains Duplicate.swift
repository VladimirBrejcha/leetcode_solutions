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
