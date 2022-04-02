// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/887/

func longestCommonPrefix(strs []string) string {
    prefix := strs[0]
    if len(prefix) == 0 { return "" }
    
    for i := 1; i < len(strs); i++ {
        str := strs[i]
        if len(str) == 0 { return "" }
        
        for i, s := range str {
            if len(prefix) < i + 1 {
                break
            }
            if s != rune(prefix[i]) {
                prefix = prefix[:i]
                break
            }
            if i == len(str) - 1 {
                prefix = prefix[:i + 1]
            }
        }
        
        if len(prefix) == 0 { return "" }
    }
    
    return prefix
}
