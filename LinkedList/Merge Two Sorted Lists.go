// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/771/

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    var current1, current2 *ListNode = l1, l2
    dummy := &ListNode{0, current1}
    
    for current1 != nil && current2 != nil {
        var next1, next2 *ListNode = selectNonNil(current1.Next, current2.Next)
        
        current2.Next = next1
        current1.Next = current2
        
        current1 = next1
        current2 = next2
    }
    
    sort(dummy.Next)
    
    return dummy.Next
}

func sort(head *ListNode) {
    current := head
    for current.Next != nil {
        if current.Val > current.Next.Val {
            current.Val, current.Next.Val = current.Next.Val, current.Val
            sort(head)
        }
        current = current.Next
    }
}

func selectNonNil(l1 *ListNode, l2 *ListNode) (*ListNode, *ListNode) {
    if l1 == nil {
        return l2, nil
    } else if l2 == nil {
        return l1, nil
    } else {
        return l1, l2
    }
}
