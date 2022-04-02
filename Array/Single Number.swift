// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/549/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var histogram: Dictionary<Int, Int> = [:]
        
        for num in nums {
            histogram[num, default: 0] += 1
            if histogram[num] == 2 {
                histogram[num] = nil
            }
        }
        
        return histogram.first!.key
    }
}

// O(n) time and O(1) memory
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
      var xor = 0
      for num in nums {
         xor ^= num
      }
      return xor
    }
}
