// [1,2,5] [1,1,3,4,6]
// [1,1,1,2,3,4,5,6]

func merge(arr1: [Int], arr2: [Int]) -> [Int] {
   var result = [Int]()

   var index1: Int = 0
   var index2: Int = 0

   while true {
      let el1 = arr1[index1]
      let el2 = arr2[index2]

      if el1 <= el2 {
         result.append(el1)
         if index1 == arr1.count - 1 {
            result.append(contentsOf: arr2[index2...arr2.count - 1])
            return result
         }
         index1 += 1
      } else {
         result.append(el2)
         if index2 == arr2.count - 1 {
            result.append(contentsOf: arr1[index1...arr1.count - 1])
            return result
         }
         index2 += 1
      }
   }

   return result
}

print(merge(arr1: [1,2,5], arr2: [1,1,3,4,6]))
