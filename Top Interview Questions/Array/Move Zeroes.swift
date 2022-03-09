// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/567/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var numberOfZeroes = 0
        var i = 0
        while (i < nums.count - numberOfZeroes) {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
                numberOfZeroes += 1
            } else {
                i += 1
            }
        }
    }
}

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count == 1 { return }
        
        var slow: Int?
        
        for fast in 0..<nums.count {
            if nums[fast] == 0 {
                continue
            }
            
            if slow == nil {
                if fast == 0 {
                    slow = 0
                    continue
                }
                nums[0] = nums[fast]
                nums[fast] = 0
                slow = 0
                continue
            }
            
            if fast - slow! > 0 && nums[slow! + 1] == 0 {
                nums[slow! + 1] = nums[fast]
                nums[fast] = 0
            }
            slow! += 1
        }
    }
}
