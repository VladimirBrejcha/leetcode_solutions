// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/646/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let kNormilized = k % nums.count
        nums = Array(nums[nums.count - kNormilized..<nums.count] + nums[0..<nums.count - kNormilized])
    }
}

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let kNormilized = k % nums.count
        
        var queue: [Int] = Array(nums[nums.count - kNormilized..<nums.count])
        
        for i in 0..<nums.count {
            queue.append(nums[i])
            nums[i] = queue[i]
        }
    }
}
