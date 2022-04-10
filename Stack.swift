struct Stack<Element>:
   ExpressibleByArrayLiteral,
   Sequence,
   CustomStringConvertible,
   CustomDebugStringConvertible,
   CustomReflectable
{
   private var storage: [Element] = []

   var top: Element? { storage.last }

   mutating func push(_ element: Element) {
      storage.append(element)
   }

   @discardableResult mutating func pop() -> Element? {
      if storage.isEmpty {
         return nil
      }
      return storage.removeLast()
   }

   // MARK: - ExpressibleByArrayLiteral

   init(arrayLiteral elements: Element...) {
      storage = elements
   }

   // MARK: - Sequence

   func makeIterator() -> some IteratorProtocol {
      storage.makeIterator()
   }

   // MARK: - CustomStringConvertible

   var description: String { storage.description }

   // MARK: - CustomDebugStringConvertible

   var debugDescription: String {
      let count = storage.count
      return "\(count) \(count == 1 ? "element" : "elements")"
   }

   // MARK: - CustomReflectable

   var customMirror: Mirror { .init(reflecting: storage) }
}

extension Stack: Equatable where Element: Equatable { }
extension Stack: Hashable where Element: Hashable { }
extension Stack: Decodable where Element: Decodable { }
extension Stack: Encodable where Element: Encodable { }

var stackA: Stack<Int> = [0, 1, 2]
print(stackA)
stackA.pop()
print(stackA)
stackA.push(17)
print(stackA)

for element in stackA.reversed() {
   print(element)
}

let stackB: Stack<Int> = [0, 1, 17]
print(stackA == stackB)

let arr1 = [1,2]
dump(arr1)
dump(stackB)
