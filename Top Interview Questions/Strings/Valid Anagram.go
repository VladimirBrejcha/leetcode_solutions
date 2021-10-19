// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/882/

func isAnagram(s string, t string) bool {
    if len(s) != len(t) { return false }

    sortString(&s)
    sortString(&t)
    return s == t
}

func sortString(input *string) {
	runeArray := []rune(*input)
	sort.Sort(sortRuneString(runeArray))
    *input = string(runeArray)
	fmt.Println(string(runeArray))
}

type sortRuneString []rune

func (s sortRuneString) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s sortRuneString) Less(i, j int) bool {
	return s[i] < s[j]
}

func (s sortRuneString) Len() int {
	return len(s)
}
