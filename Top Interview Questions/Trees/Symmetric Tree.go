// https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/627/

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
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
