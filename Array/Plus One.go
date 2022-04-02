// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/559/

func plusOne(digits []int) []int {

    for index := len(digits) - 1; index >= 0; index-- {
        value := digits[index]

        if index == 0 && value == 9 {
            digits[index] = 1
            digits = append(digits, 0)
            break
        }

        if value == 9 {
            digits[index] = 0
        } else {
            digits[index] = value + 1
            break
        }
    }

    return digits

}
