// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/883/

import "unicode"

func isPalindrome(s string) bool {

    rev_i := len(s) - 1

    for _, v := range s {

        if isNotAlphanumeric(byte(v)) { continue }

        var rev_v byte

        for true {
            rev_v = s[rev_i]
            if isNotAlphanumeric(rev_v) {
                rev_i--
            } else {
                break
            }
	    }

        if unicode.ToLower(v) != unicode.ToLower(rune(rev_v)) { return false }

        rev_i--
    }

    return true
}

func isNotAlphanumeric(s byte) bool {
    return !(('a' <= s && s <= 'z') || ('A' <= s && s <= 'Z') || ('0' <= s && s <= '9'))
}
