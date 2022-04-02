// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/770/

func rotate(matrix [][]int) {
    
    numberOfSquares := len(matrix) / 2
    
    for squareI := 0; squareI < numberOfSquares; squareI++ {
        
        lastI := len(matrix) - 1 - squareI
        
        for i := squareI; i < lastI; i++ {
            revI := lastI - i + squareI
        
            matrix[i][lastI], matrix[revI][squareI], matrix[lastI][revI], matrix[squareI][i] =
            matrix[squareI][i], matrix[lastI][revI], matrix[i][lastI], matrix[revI][squareI]
        }
    } 
}
