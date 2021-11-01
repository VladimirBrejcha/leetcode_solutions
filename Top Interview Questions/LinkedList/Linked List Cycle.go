// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/773/

Long runtime solition

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func hasCycle(head *ListNode) bool {
    
    dummy := ListNode{-1, head}
    
    next := dummy.Next
    for next != nil {
        
        if next.Next == nil {
            return false
        }
        
        dummyNext := dummy.Next
        for dummyNext != nil {
            
            if next.Next == dummyNext {
                return true
            }
            
            if dummyNext.Val == next.Val && dummyNext.Next.Val == next.Next.Val {
                break
            }
            
            dummyNext = dummyNext.Next
        }
        
        next = next.Next
    }
    
    return false
}
