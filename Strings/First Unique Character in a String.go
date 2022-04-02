// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/881/

type Pair struct {
    appears int
    index int
}

func firstUniqChar(s string) int {
    var histogram = make(map[rune]Pair, len(s))

    for i, v := range s {
        histogram[v] = Pair{histogram[v].appears + 1, i}
    }

    values := make([]Pair, len(s))
    for _, v := range histogram {
        values[v.index] = v
    }

    for _, v := range values {
        if v.appears == 1 {
            return v.index
        }
    }

    return -1
}
