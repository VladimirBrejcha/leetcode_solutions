// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/646/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let kNormilized = k % nums.count
        nums = Array(nums[nums.count - kNormilized..<nums.count] + nums[0..<nums.count - kNormilized])
    }
}
