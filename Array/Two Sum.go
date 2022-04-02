// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/546/

func twoSum(nums []int, target int) []int {
    for i,v := range nums {
        for i2, v2 := range nums[i + 1:] {
            if v + v2 == target {
                return []int{i, i + i2 + 1}
            }
        }
    }
    return []int{}
}
