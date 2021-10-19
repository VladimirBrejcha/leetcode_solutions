// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/772/

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func isPalindrome(head *ListNode) bool {
    
    listLen := count(head, 1)
    if listLen == 1 { return true }
    if listLen % 2 != 0 { listLen++ }
    
    reversed := reverseList(nodeAt(head, (listLen) / 2))
    
    for reversed.Next != nil {
        if head.Val != reversed.Val {
            return false
        }
        head = head.Next
        reversed = reversed.Next
    }
    
    return head.Val == reversed.Val
}

func reverseList(head *ListNode) *ListNode {
    var previousNode *ListNode
    var currentNode *ListNode = head
    var nextNode *ListNode = head.Next
    for nextNode != nil {
        currentNode.Next = previousNode
        previousNode = currentNode
        currentNode = nextNode
        nextNode = nextNode.Next
    }
    currentNode.Next = previousNode
    return currentNode
}

func nodeAt(head *ListNode, index int) *ListNode {
    if index <= 0 {
        return head
    }
    index--
    return nodeAt(head.Next, index)
}

func count(head *ListNode, counter int) int {
    if head.Next == nil { return counter }
    counter++
    return count(head.Next, counter)
}
