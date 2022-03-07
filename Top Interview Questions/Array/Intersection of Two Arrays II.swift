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

class Solution {
   func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      var intersection = [Int]()

      let a = nums1.sorted()
      let b = nums2.sorted()

      var a_i = 0
      var b_i = 0

      while (a_i < a.count && b_i < b.count) {
         if a[a_i] == b[b_i] {
            intersection.append(a[a_i])
            a_i += 1
            b_i += 1
         } else {
            if a[a_i] > b[b_i] {
               b_i += 1
            } else {
               a_i += 1
            }
         }
      }

      return intersection
   }
}

class Solution {
   func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      let a = nums1.reduce(into: [Int:Int]()) { partialResult, num in
         partialResult[num, default: 0] += 1
      }
      return nums2
         .reduce(into: [Int:Int]()) { partialResult, num in
            partialResult[num, default: 0] += 1
         }
         .reduce(into: [Int]()) { partialResult, dict in
            if a[dict.key] == nil { return }
            partialResult.append(
               contentsOf: Array(
                  repeating: dict.key, count: min(dict.value, a[dict.key]!)
               )
            )
         }
   }
}
