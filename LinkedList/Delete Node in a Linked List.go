// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/553/

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteNode(node *ListNode) {
    if node.Next == nil { return }
    node.Val = node.Next.Val
    node.Next = node.Next.Next
}
