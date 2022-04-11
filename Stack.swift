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

// MARK: - Tests -

// MARK: - Accessors Tests

print("=== Accessors Tests ===")

print("Create [0, 1, 2] stack")
var stackA: Stack<Int> = [0, 1, 2]
print(stackA)
print("pop")
stackA.pop()
print(stackA)
print("push 17")
stackA.push(17)
print(stackA)

// MARK: - Sequence Tests

print("=== Sequence Tests ===")

print("All elements of [0, 1, 17] stack")
for element in stackA {
   print(element)
}

// MARK: - Equatable & Hashable Tests

print("=== Equatable & Hashable Tests ===")

print("Create another [0, 1, 17] stack")
let stackB: Stack<Int> = [0, 1, 17]
print("Equality:")
print(stackA == stackB)
print("Equality of hashes:")
print(stackA.hashValue == stackB.hashValue)

// MARK: - Debug logging tests

print("=== Debug logging tests ===")

print("dump [1, 2] stack:")
let arr1 = [1,2]
dump(arr1)
print("dump [0, 1, 17] stack:")
dump(stackB)

// MARK: - Copy On Write Tests

print("=== Copy On Write Tests ===")

let stack1: Stack<Int> = [1, 2]
var stack2 = stack1

print("stack1: \(stack1)")
print("stack2: \(stack2)")

print("push 3 to stack2")
stack2.push(3)
print("stack1: \(stack1)")
print("stack2: \(stack2)")

print("pop from stack2")
stack2.pop()
print("pop from stack2")
stack2.pop()
print("stack1: \(stack1)")
print("stack2: \(stack2)")
