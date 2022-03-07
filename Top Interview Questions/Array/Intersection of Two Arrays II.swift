// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/674/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = [Int]()

        let a = nums1.count >= nums2.count ? nums2 : nums1
        let b = nums1.count >= nums2.count ? nums1 : nums2

        var validIndexes = Set(0..<b.count)

        a.forEach { elementA in
            for i in validIndexes {
                let elementB = b[i]

                if elementA == elementB {
                    validIndexes.remove(i)
                    intersection.append(elementA)
                    print(intersection)
                    break
                }
            }
        }
        return intersection
    }
}
