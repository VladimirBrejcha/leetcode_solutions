/**
// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/603/

* Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func removeNthFromEnd(head *ListNode, n int) *ListNode {
    if head.Next == nil { return nil }
    
    last_i := last_i(head, 0)
    index_to_delete := last_i - n + 1
    
    current_node := head
    
    for i := 0; i <= index_to_delete; i++ {
        if i == last_i - 1 && i != index_to_delete {
            current_node.Next = nil
            return head
        }
        if i == index_to_delete {
            current_node.Val = current_node.Next.Val
            current_node.Next = current_node.Next.Next
        } else {
            current_node = current_node.Next
        }
    }
    
    return head
}

func last_i(head *ListNode, counter int) int {
    if head.Next == nil { return counter }
    counter++
    return last_i(head.Next, counter)
}
