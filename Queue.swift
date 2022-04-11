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

   fileprivate var head: Node<Element>?
   private var tail: Node<Element>?

   mutating func enqueue(_ element: Element) {
      copy()
      let oldTail = tail
      self.tail = Node(value: element)
      if head == nil {
         head = tail
      } else {
         oldTail?.next = tail
      }
   }

   @discardableResult mutating func dequeue() -> Element? {
      copy()
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
      return "[\(head.description)]"
   }

   // MARK: - CustomDebugStringConvertible

   var debugDescription: String {
      guard let head = head else {
         return "Empty queue"
      }
      return "[\(head.description)]"
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

   // MARK: - Copying

   private mutating func copy() {
      guard !isKnownUniquelyReferenced(&head) else {
         return
      }

      guard var oldHead = head else {
         return
      }

      head = Node(value: oldHead.value)
      var newHead = head

      while let nextOldHead = oldHead.next {
         newHead!.next = Node(value: nextOldHead.value)
         newHead = newHead!.next

         oldHead = nextOldHead
      }

      tail = newHead
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

// MARK: - Tests -

// MARK: - Accessors Tests

print("=== Accessors Tests ===")

var queueA: Queue<Int> = Queue()
print("Create empty queue:")
print(queueA)
print("Enqueue 1:")
queueA.enqueue(1)
print(queueA)
print("Enqueue 2:")
queueA.enqueue(2)
print(queueA)
print("Dequeue \(queueA.dequeue()!)")
print(queueA)
print("Peek \(queueA.peek()!)")
print("Dequeue \(queueA.dequeue()!)")
print(queueA)
print("Dequeue \(String(describing: queueA.dequeue()))")
print(queueA)
print("Enqueue 1:")
queueA.enqueue(1)
print(queueA)

// MARK: - ExpressibleByArrayLiteral Tests

print("=== ExpressibleByArrayLiteral Tests ===")

let queueB: Queue<Int> = [1, 2, 3]
print("Create [1, 2, 3] queue:")
print(queueB)

// MARK: - Equatable & Hashable Tests

print("=== Equatable & Hashable Tests ===")

print("Create two [1, 2] queues")
let queueC: Queue<Int> = [1, 2]
let queueD: Queue<Int> = [1, 2]
print("Check equality:")
print(queueC == queueD)
print("Check equality of hashes:")
print(queueC.hashValue == queueD.hashValue)

// MARK: - Sequence Tests

print("=== Sequence Tests ===")

print("all elements of queue [1, 2]")
for element in queueD {
   print(element)
}

// MARK: - Debug logging tests

print("=== Debug logging tests ===")

print("dump [1, 2] queue:")
dump(queueD)
print("reflect [1, 2] queue:")
print(String(reflecting: queueD))

// MARK: - Collection Indexes Tests

print("=== Collection Indexes Tests ===")

print("Create [0, 1, 2, 3, 4, 5] queue")
let queueV: Queue<Int> = [0, 1, 2, 3, 4, 5]
print("Get index of startIndex + 2")
let indexOfThirdElement = queueV.index(queueV.startIndex, offsetBy: 2)
print("Element at index:")
print(queueV[indexOfThirdElement])

// MARK: - Copy On Write Tests

print("=== Copy On Write Tests ===")

let queue1: Queue<Int> = [1, 2]
var queue2 = queue1

print("queue1: \(queue1)")
print("queue2: \(queue2)")

print("enqueue 3 to queue2")
queue2.enqueue(3)
print("queue1: \(queue1)")
print("queue2: \(queue2)")

print("dequeue from queue2")
queue2.dequeue()
print("dequeue from queue2")
queue2.dequeue()
print("queue1: \(queue1)")
print("queue2: \(queue2)")
