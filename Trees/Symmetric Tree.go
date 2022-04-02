// https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/627/

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */

// first attempt, works but VERY slow

func isSymmetric(root *TreeNode) bool {
    queue := make([]*TreeNode, 0)
    queue = append(queue, root)
    return checkSymmetric(queue)
}

func checkSymmetric(queue []*TreeNode) bool {
    if (!isBreadthSymmetric(queue)) {
        return false
    }
    
    nextBreadthQueue := make([]*TreeNode, 0)
    breadthEmpty := true
    
    for len(queue) > 0 {
        node := queue[0]
        queue = queue[1:]
        if node == nil {
            nextBreadthQueue = append(nextBreadthQueue, nil)
            nextBreadthQueue = append(nextBreadthQueue, nil)
            continue
        }
        if node.Left != nil || node.Right != nil {
            breadthEmpty = false
        }
        nextBreadthQueue = append(nextBreadthQueue, node.Left)
        nextBreadthQueue = append(nextBreadthQueue, node.Right)
    }
    
    if breadthEmpty {
        return true
    }
    
    return checkSymmetric(nextBreadthQueue)
}

func isBreadthSymmetric(nodes []*TreeNode) bool {
    lenght := len(nodes)
    for i, j := 0, lenght - 1; i < lenght / 2; i, j = i + 1, j - 1 {
        node1 := nodes[i]
        node2 := nodes[j]
        if node1 == nil && node2 == nil { continue }
        if node1 == nil && node2 != nil || node2 == nil && node1 != nil {
            return false
        }
        if node1.Val != node2.Val { return false }
    }
    return true
}

// Better, still slow

func isSymmetric(root *TreeNode) bool {
    queue := []*TreeNode{root.Left, root.Right}
    
    for true {
        nextBreadthQueue := make([]*TreeNode, len(queue) * 2)
        currentBreadthEmpty := true
        for i, j := 0, len(queue) - 1; i < len(queue) / 2; i, j = i + 1, j - 1 {
            node1 := queue[i]
            node2 := queue[j]
            if node1 == nil && node2 == nil {
                continue
            }
            if node1 == nil && node2 != nil || node2 == nil && node1 != nil {
                return false
            }
            if node1.Val != node2.Val { return false }
            nextBreadthQueue[i * 2] = node1.Left
            nextBreadthQueue[(i * 2) + 1] = node1.Right
            nextBreadthQueue[j * 2] = node2.Left
            nextBreadthQueue[(j * 2) + 1] = node2.Right
            if node1.Left != nil || node1.Right != nil || node2.Left != nil || node2.Right != nil {
                currentBreadthEmpty = false
            }
        }
        if currentBreadthEmpty {
            return true
        }
        queue = nextBreadthQueue
    }

    return true
}

// Final solution, clean and fast

func isSymmetric(root *TreeNode) bool {
    queue := []*TreeNode{root.Left, root.Right}
    
    for len(queue) > 0 {
        node1 := queue[0]
        node2 := queue[1]
        
        queue = queue[2:]
        
        if node1 == nil && node2 == nil {
            continue
        }
        if node1 == nil && node2 != nil || node2 == nil && node1 != nil {
            return false
        }
        if node1.Val != node2.Val {
            return false
        }
        
        queue = append(queue, node1.Left)
        queue = append(queue, node2.Right)
        queue = append(queue, node1.Right)
        queue = append(queue, node2.Left)
    }
    
    return true
}
