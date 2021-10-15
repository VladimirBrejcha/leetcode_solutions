// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/560/

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reverseList(head *ListNode) *ListNode {
    if head == nil { return nil }
    if head.Next == nil { return head }
    
    _, result_head := exchangeLatest(head)
    return result_head
}

func exchangeLatest(node *ListNode) (*ListNode, *ListNode) {
    if node.Next == nil {
        head := &ListNode{node.Val, nil}
        return head, head
    }
    result, result_head := exchangeLatest(node.Next)
    result.Next = &ListNode{node.Val, nil}
    return result.Next, result_head
}
