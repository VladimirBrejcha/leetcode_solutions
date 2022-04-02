// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/559/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var i = digits.count - 1
        while (i >= 0) {
            if result[i] == 9 {
                result[i] = 0
                if i == 0 {
                    result.insert(1, at: 0)
                    return result
                }
                i -= 1
            } else {
                result[i] += 1
                return result
            }
        }
        return result
    }
}
