// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        var i = 1
        var prev: Int = nums[0]

        while (i <= nums.count - 1) {
            if prev == nums[i] {
                for j in i..<nums.count - 1 {
                    nums[j] = nums[j + 1]
                }
                nums.removeLast()
            } else {
                prev = nums[i]
                i += 1
            }
        }
      
        return nums.count
    }
}
