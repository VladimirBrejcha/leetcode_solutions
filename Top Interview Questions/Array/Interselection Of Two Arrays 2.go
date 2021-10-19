// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/674/

func intersect(nums1 []int, nums2 []int) []int {
    map1 := make(map[int]int)
    map2 := make(map[int]int)
    var result []int
    
    for _, element := range nums1 {        
        map1[element] ++
    }
    
    for _, element2 := range nums2 {
        map2[element2]++
    }
    
    for element, numberOfElements := range map1 {
        if map2[element] == 0 {
            continue
        }
        
        if numberOfElements > map2[element] {
            for i := 0; i < map2[element]; i++ {
                result = append(result, element)
            }
        } else {
            for i := 0; i < numberOfElements; i++ {
                result = append(result, element)
            }  
        }
    }
    
    return result
}
