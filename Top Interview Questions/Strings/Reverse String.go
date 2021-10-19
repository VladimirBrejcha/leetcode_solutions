// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/879/

func reverseString(s []byte)  {
    for i := 0; i < len(s) / 2; i++ {
        s[i], s[len(s) - 1 - i] = s[len(s) - 1 - i], s[i]
    }
}
