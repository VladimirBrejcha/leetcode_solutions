// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/567/

func moveZeroes(nums []int)  {
    nums = moveZero(nums)
}

func moveZero(nums []int) []int {
    for index, value := range nums {
        if value != 0 {
            continue
        }
        firstPart := nums[:index]
        secondPart := nums[index + 1:]
        secondPartMoved := moveZero(secondPart)
        full := append(firstPart, secondPartMoved...)
        return append(full, 0)
    }
    return nums
}
