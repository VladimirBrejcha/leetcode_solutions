// https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/628/

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func levelOrder(root *TreeNode) [][]int {
    if root == nil { return [][]int{} }
    
    var result [][]int = make([][]int, 0)
    result = append(result, []int{root.Val})
    
    var queue []*TreeNode = make([]*TreeNode, 0)
    queue = append(queue, root)
    
    for true {
        nextBreadthQueue := make([]*TreeNode, 0)
        breadthValues := make([]int, 0)
        
        for len(queue) > 0 {
            node := queue[0]
            queue = queue[1:]
        
            if node.Left != nil {
                breadthValues = append(breadthValues, node.Left.Val)
                nextBreadthQueue = append(nextBreadthQueue, node.Left)
            }
            if node.Right != nil {
                breadthValues = append(breadthValues, node.Right.Val)
                nextBreadthQueue = append(nextBreadthQueue, node.Right)   
            }
        }
        
        if len(breadthValues) > 0 {
            result = append(result, breadthValues)
        }
        
        queue = nextBreadthQueue
        
        if len(nextBreadthQueue) == 0 {
            break
        }
    }
    
    return result
}
