struct Stack<Element>:
   ExpressibleByArrayLiteral,
   Sequence,
   CustomStringConvertible,
   CustomDebugStringConvertible,
   CustomReflectable,
   Collection
{
   private var storage: [Element] = []

   var top: Element? { storage.last }

   mutating func push(_ element: Element) {
      storage.append(element)
   }

   @discardableResult mutating func pop() -> Element? {
      if storage.isEmpty { return nil }
      return storage.removeLast()
   }

   // MARK: - ExpressibleByArrayLiteral

   init(arrayLiteral elements: Element...) {
      storage = elements
   }

   // MARK: - Sequence

   func makeIterator() -> Array<Element>.Iterator {
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

   // MARK: - Collection

   typealias Index = Array<Element>.Index

   var startIndex: Index { storage.startIndex }

   var endIndex: Index { storage.endIndex }

   func index(after i: Index) -> Index {
      storage.index(after: i)
   }

   subscript(position: Array<Element>.Index) -> Element {
      storage[position]
   }
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
