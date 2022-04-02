// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/770/

// With additional space
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var anotherMatrix = matrix
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                anotherMatrix[j][(matrix[i].count - 1) - i] = matrix[i][j]
            }
        }
        
        matrix = anotherMatrix
    }
}

// With queue
class Solution {
    func rotate(_ matrix: inout [[Int]]) {        
        
        let size = matrix.count
        var queue = Array<Int>()
        
        for i in 0..<size {
            for j in 0..<size {
                queue.append(matrix[j][size - 1 - i])
            }
        }
        
        for i in 0..<size {
            for j in 0..<size {
                matrix[size - 1 - i][size - 1 - j] = queue.removeFirst()
            }
        }
    }
}
