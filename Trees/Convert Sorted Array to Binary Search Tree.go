// https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/631/

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sortedArrayToBST(nums []int) *TreeNode {
    return recursiveConvert(nums, 0, len(nums) - 1)
}

func recursiveConvert(nums []int, start int, end int) *TreeNode  {
    if start > end { return nil }
    
    middle := (start + end) / 2
    
    node := &TreeNode{nums[middle], nil, nil}
    
    node.Left = recursiveConvert(nums, start, middle - 1)
    node.Right = recursiveConvert(nums, middle + 1, end)
    
    return node
}
