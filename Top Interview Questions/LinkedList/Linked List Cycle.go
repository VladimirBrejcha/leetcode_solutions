// https://leetcode.com/explore/interview/card/top-interview-questions-easy/93/linked-list/773/

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */

// O(n^2) and O(1) memory

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

// O(n) and O(n) memory

func hasCycle(head *ListNode) bool {
    
    histogram := make(map[*ListNode]bool)
    
    next := head
    for next != nil {
        
        if next.Next == nil {
            return false
        }
        
        if histogram[next] == true {
            return true
        }
        
        histogram[next] = true
        
        next = next.Next
    }
    
    return false
}

// O(n) and O(1) memory

func hasCycle(head *ListNode) bool {
    if head == nil || head.Next == nil {
        return false
    }
    slower := head
    faster := head
    faster = faster.Next
    
    for faster.Next != nil && faster.Next.Next != nil {
        if faster == slower {
            return true
        }
        
        faster = faster.Next.Next
        slower = slower.Next
    }
    
    return false
}
