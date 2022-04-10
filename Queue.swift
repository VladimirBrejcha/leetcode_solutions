struct Queue<Element>:
   ExpressibleByArrayLiteral,
   CustomStringConvertible,
   CustomDebugStringConvertible,
   CustomReflectable,
   Sequence
{
   private var head: Node<Element>?
   private var tail: Node<Element>?

   mutating func enqueue(_ element: Element) {
      let oldTail = tail
      self.tail = Node(element: element)
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
      return head.element
   }

   func peek() -> Element? {
      guard let head = head else {
         return nil
      }
      return head.element
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
         children: { () -> KeyValuePairs<String, Any> in
            if let head = head, let tail = tail {
               return ["head": head.element, "tail": tail.element]
            } else {
               return [:]
            }
         }()
      )
   }

   // MARK: - Sequence

   func makeIterator() -> Iterator {
      Iterator(current: head)
   }
}

extension Queue {
   struct Iterator: IteratorProtocol {
      var current: Node<Element>?

      mutating func next() -> Element? {
         if current == nil {
            return nil
         } else {
            defer { current = current?.next }
            return current?.element
         }
      }
   }
}

extension Queue {
   class Node<Element>: CustomStringConvertible {
      let element: Element
      var next: Node<Element>? = nil

      init(element: Element) {
         self.element = element
      }

      // MARK: - CustomStringConvertible

      var description: String {
         guard let next = next else { return "\(element)" }
         return "\(element) -> \(next)"
      }
   }
}

extension Queue: Equatable where Element: Equatable {
   static func == (lhs: Queue<Element>, rhs: Queue<Element>) -> Bool {
      var lhsNext = lhs.head
      var rhsNext = rhs.head
      repeat {
         if lhsNext == nil && rhsNext == nil { return true }
         if lhsNext?.element != rhsNext?.element {
            return false
         }
         lhsNext = lhsNext?.next
         rhsNext = rhsNext?.next
      } while true
   }
}

extension Queue: Hashable where Element: Hashable {
   func hash(into hasher: inout Hasher) {
      var next = head
      while next != nil {
         hasher.combine(next?.element)
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

let queueC: Queue<Int> = [1, 3]
let queueD: Queue<Int> = [1, 2, 3]
print(queueC == queueD)
print(queueC.hashValue == queueD.hashValue)

dump(queueD)

for element in queueD {
   print(element)
}

print(String(reflecting: queueD))

