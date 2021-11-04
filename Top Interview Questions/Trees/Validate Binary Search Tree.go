// https://leetcode.com/explore/item/625

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */

import "math"

func isValidBST(root *TreeNode) bool {    
    return BreadthFirst(root, int(math.MinInt64), int(math.MaxInt64))
}

func BreadthFirst(node *TreeNode, min int, max int) bool {
    if node == nil {
        return true
    }
    if node.Val >= max {
        return false
    }
    if node.Val <= min {
        return false
    }
    return BreadthFirst(node.Left, min, node.Val) && BreadthFirst(node.Right, node.Val, max)
}
