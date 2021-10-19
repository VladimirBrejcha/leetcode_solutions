// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/885/

func strStr(haystack string, needle string) int {
    if needle == "" { return 0 }
    if haystack == needle { return 0 }

    counter := 0

    for i := 0; i < len(haystack); i++ {
        if haystack[i] == needle[counter] {
            counter++
        } else if counter != 0 {
            i = i - counter
            counter = 0
        }
        if counter == len(needle) {
            return i - counter + 1
        }
    }

    return -1
}
