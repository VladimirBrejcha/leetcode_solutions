// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/769/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
      let sequence = board.flatMap { $0 }

      var numbersStorage = Set<Int>(minimumCapacity: 9)

      for i in 0..<9 {

         // check i'th row
         for j in i*9...(i*9)+8 {
            if let number = sequence[j].wholeNumberValue {
               if numbersStorage.update(with: number) != nil {
                  return false
               }
            }
         }

         numbersStorage.removeAll(keepingCapacity: true)

         // check i'th column
         var z = i
         repeat {
            if let number = sequence[z].wholeNumberValue {
               if numbersStorage.update(with: number) != nil {
                  return false
               }
            }
            z += 9
         } while z < 81

         numbersStorage.removeAll(keepingCapacity: true)

         // check i'th box
         func calcX() -> Int {
            if i == 0 {
               return 0
            } else if i == 1 {
               return 3
            } else if i == 2 {
               return 6
            } else if i == 3 {
               return 27
            } else if i == 4 {
               return 30
            } else if i == 5 {
               return 33
            } else if i == 6 {
               return 54
            } else if i == 7 {
               return 57
            } else if i == 8 {
               return 60
            }
            fatalError()
         }
         var x: Int = calcX()

         var supportingCounter = 0
         repeat {
            if let number = sequence[x].wholeNumberValue {
               if numbersStorage.update(with: number) != nil {
                  return false
               }
            }
            if supportingCounter == 2 {
               supportingCounter = 0
               x += 7
            } else {
               supportingCounter += 1
               x += 1
            }
         } while x <= calcX() + 20

         numbersStorage.removeAll(keepingCapacity: true)
      }

      return true
    }
}
