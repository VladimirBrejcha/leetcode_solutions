// Write a function:
// public func solution(_ A : inout [Int]) -> Int
// that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
// For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
// Given A = [1, 2, 3], the function should return 4.
// Given A = [−1, −3], the function should return 1.
// Write an efficient algorithm for the following assumptions:
// N is an integer within the range [1..100,000];
// each element of array A is an integer within the range [−1,000,000..1,000,000].


// Perfomance on a Array(-100000...99998)
// Solution1 - 0.3657438230002299
// Solution2 - 0.26267487599943706
// Solution3 - 0.18208694200075115

// Perfomance on Array(1...10)
// Solution1 - 0.001348080000752816
// Solution2 - 0.00030705499921168666
// Solution3 - 0.00015057700147735886

public func solution1(_ A : inout [Int]) -> Int {
    var histogram: Dictionary<Int, Int> = [:]

    for value in A {
        if value > 0 {
            histogram[value, default: 0] += 1
        }
    }

    for intValue in 1..<100000 {
        if histogram[intValue] == nil {
            return intValue
        }
    }

    return 1
}

public func solution2(_ A : inout [Int]) -> Int {
  
   var result = 1

   for value in A.sorted() {
      if value <= 0 {
         continue
      }
      if result == value {
         result += 1
         continue
      }
      return result
   }

   return result
}

public func solution3(_ A : inout [Int]) -> Int {

   func findNext(_ histogram: inout Set<Int>, current: Int) -> Int {
      if !histogram.contains(current) {
         return current
      }
      return findNext(&histogram, current: current + 1)
   }

   var histogram: Set<Int> = []
   var result = 1

   for value in A {
      if value <= 0 { continue }
      histogram.insert(value)
      if result == value {
         result = findNext(&histogram, current: result + 1)
      }
   }

   return result
}
