// https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/555/

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxDepth(root *TreeNode) int {
    if root == nil { return 0 }
    max := Max(maxDepth(root.Left), maxDepth(root.Right))
    return max + 1
}

func Max(x, y int) int {
   if x > y {
     return x
   }
   return y
}
