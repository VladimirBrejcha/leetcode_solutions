struct Queue<Element>:
   ExpressibleByArrayLiteral,
   CustomStringConvertible,
   CustomDebugStringConvertible,
   CustomReflectable,
   Sequence,
   Collection
{
   class Node<Value>: CustomStringConvertible {
      let value: Value
      var next: Node<Value>? = nil

      init(value: Value) {
         self.value = value
      }

      // MARK: - CustomStringConvertible

      var description: String {
         guard let next = next else { return "\(value)" }
         return "\(value) -> \(next)"
      }
   }

   private var head: Node<Element>?
   private var tail: Node<Element>?

   mutating func enqueue(_ element: Element) {
      let oldTail = tail
      self.tail = Node(value: element)
      if head == nil {
         head = tail
      } else {
         oldTail?.next = tail
      }
   }

   @discardableResult mutating func dequeue() -> Element? {
      guard let head = head else {
         return nil
      }
      defer {
         self.head = head.next
         if head.next == nil { tail = nil }
      }
      return head.value
   }

   func peek() -> Element? {
      guard let head = head else {
         return nil
      }
      return head.value
   }

   // MARK: - ExpressibleByArrayLiteral

   init(arrayLiteral elements: Element...) {
      elements.forEach { enqueue($0) }
   }

   // MARK: - CustomStringConvertible

   var description: String {
      guard let head = head else {
         return "Empty queue"
      }
      return head.description
   }

   // MARK: - CustomDebugStringConvertible

   var debugDescription: String {
      guard let head = head else {
         return "Empty queue"
      }
      return head.description
   }

   // MARK: - CustomReflectable

   var customMirror: Mirror {
      Mirror(
         self,
         unlabeledChildren: self,
         displayStyle: .collection
      )
   }

   // MARK: - Sequence

   struct Iterator: IteratorProtocol {
      var current: Node<Element>?

      mutating func next() -> Element? {
         if current == nil {
            return nil
         } else {
            defer { current = current?.next }
            return current?.value
         }
      }
   }

   func makeIterator() -> Iterator {
      Iterator(current: head)
   }

   // MARK: - Collection

   struct Index: Comparable {

      var node: Node<Element>?

      // MARK: - Comparable

      static func < (lhs: Queue<Element>.Index, rhs: Queue<Element>.Index) -> Bool {
         guard lhs != rhs else {
            return false
         }
         let nodes = sequence(first: lhs.node) { $0?.next }
         return nodes.contains { $0 === rhs.node }
      }

      static func == (lhs: Queue<Element>.Index, rhs: Queue<Element>.Index) -> Bool {
         switch (lhs.node, rhs.node) {
         case let (left?, right?):
            return left.next === right.next
         case (nil, nil):
            return true
         default:
            return false
         }
      }
   }

   subscript(position: Index) -> Element {
      position.node!.value
   }

   var startIndex: Index {
      Index(node: head)
   }

   var endIndex: Index {
      Index(node: tail)
   }

   func index(after i: Index) -> Index {
      Index(node: i.node?.next)
   }
}

// MARK: - Equatable

extension Queue: Equatable where Element: Equatable {
   static func == (lhs: Queue<Element>, rhs: Queue<Element>) -> Bool {
      var lhsNext = lhs.head
      var rhsNext = rhs.head
      repeat {
         if lhsNext == nil && rhsNext == nil { return true }
         if lhsNext?.value != rhsNext?.value {
            return false
         }
         lhsNext = lhsNext?.next
         rhsNext = rhsNext?.next
      } while true
   }
}

// MARK: - Hashable

extension Queue: Hashable where Element: Hashable {
   func hash(into hasher: inout Hasher) {
      var next = head
      while next != nil {
         hasher.combine(next?.value)
         next = next?.next
      }
   }
}

var queueA: Queue<Int> = Queue()
print(queueA)
queueA.enqueue(1)
print(queueA)
queueA.enqueue(2)
print(queueA)
print(queueA.dequeue())
print(queueA)
print(queueA.peek())
let queueB: Queue<Int> = [1, 2, 3]
print(queueB)

let queueC: Queue<Int> = [1, 2]
let queueD: Queue<Int> = [1, 2]
print(queueC == queueD)
print(queueC.hashValue == queueD.hashValue)

dump(queueD)

for element in queueD {
   print(element)
}

print(String(reflecting: queueD))

let queueV: Queue<Int> = [0,1,2,3,4,5]
let indexOfThirdElement = queueV.index(queueV.startIndex, offsetBy: 2)
print(queueV[indexOfThirdElement])
