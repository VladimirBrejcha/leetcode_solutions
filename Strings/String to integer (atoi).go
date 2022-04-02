// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/884/

func myAtoi(s string) int {
    var result_bytes []byte
    whitespaceSkipped := false
    isNegative := false
    negativityDetermined := false

    for _, v := range s {
        if !whitespaceSkipped && v == ' ' { continue }
        if !whitespaceSkipped { whitespaceSkipped = true }

        if !negativityDetermined {
            negativityDetermined = true
            if v == '-' {
                isNegative = true
                continue
            } else if v == '+' {
                isNegative = false
                continue
            }
        }

        if isDigit(v) {
            result_bytes = append(result_bytes, byte(v))
        } else {
            break
        }
    }

    result := 0

    for i, v := range result_bytes {
        rev_i := len(result_bytes) - 1 - i
        number := int(rune(v - '0'))
        if number == 0 { continue }

        multiplier := int(math.Pow(10, float64(rev_i)))

        if result / multiplier + number > math.MaxInt32 / multiplier {
            if isNegative {
                return math.MinInt32
            } else {
                return math.MaxInt32
            }
        }

        result += number * multiplier
    }

    if isNegative {
        result *= -1
    }

    return result
}

func isDigit(r rune) bool {
    return '0' <= r && r <= '9'
}
