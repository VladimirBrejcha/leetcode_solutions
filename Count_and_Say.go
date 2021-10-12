// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/886/

func countAndSay(n int) string {
    
    if n == 1 { return "1" }
    if n == 2 { return "11" }
    
    say := countAndSay(n - 1)
    result := ""
    repeat_count := 1
    
    for i, v := range say {
        
        if i == 0 { continue }
        
        if byte(v) == say[i - 1] {
            repeat_count ++  
            if i == len(say) - 1 {
                result += strconv.Itoa(repeat_count)
                result += string(v)
            }
        } else {
            result += strconv.Itoa(repeat_count)
            result += string(say[i - 1])
            if i == len(say) - 1 {
                result += "1"
                result += string(v)
            }
            repeat_count = 1
        }
    }
    
    return result
}
