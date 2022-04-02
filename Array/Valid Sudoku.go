// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/769/

// Yes, I was tired 
func square(board [][]byte, row int, column int) []byte {
    if row <= 2 {
        if column <= 2 {
            return []byte{
                board[0][0],
                board[0][1],
                board[0][2],
                board[1][0],
                board[1][1],
                board[1][2],
                board[2][0],
                board[2][1],
                board[2][2],
            }
        } else if column >= 6 {
            return []byte{
                board[0][6],
                board[0][7],
                board[0][8],
                board[1][6],
                board[1][7],
                board[1][8],
                board[2][6],
                board[2][7],
                board[2][8],
            }
        } else {
            return []byte{
                board[0][3],
                board[0][4],
                board[0][5],
                board[1][3],
                board[1][4],
                board[1][5],
                board[2][3],
                board[2][4],
                board[2][5],
            }
        }
    } else if row >= 6 {
        if column <= 2 {
            return []byte{
                board[6][0],
                board[6][1],
                board[6][2],
                board[7][0],
                board[7][1],
                board[7][2],
                board[8][0],
                board[8][1],
                board[8][2],
            }
        } else if column >= 6 {
            return []byte{
                board[6][6],
                board[6][7],
                board[6][8],
                board[7][6],
                board[7][7],
                board[7][8],
                board[8][6],
                board[8][7],
                board[8][8],
            }
        } else {
            return []byte{
                board[6][3],
                board[6][4],
                board[6][5],
                board[7][3],
                board[7][4],
                board[7][5],
                board[8][3],
                board[8][4],
                board[8][5],
            }
        }
    } else {
        if column <= 2 {
            return []byte{
                board[3][0],
                board[3][1],
                board[3][2],
                board[4][0],
                board[4][1],
                board[4][2],
                board[5][0],
                board[5][1],
                board[5][2],
            }
        } else if column >= 6 {
            return []byte{
                board[3][6],
                board[3][7],
                board[3][8],
                board[4][6],
                board[4][7],
                board[4][8],
                board[5][6],
                board[5][7],
                board[5][8],
            }
        } else {
            return []byte{
                board[3][3],
                board[3][4],
                board[3][5],
                board[4][3],
                board[4][4],
                board[4][5],
                board[5][3],
                board[5][4],
                board[5][5],
            }
        }
    }
}

func isValidSudoku(board [][]byte) bool {
    for rowIndex, row := range board {
        for columnIndex, value := range row {
            if value == '.' {
                continue
            }

            if hasRepetition(row) {
                return false
            }

            var column = []byte{
                board[0][columnIndex],
                board[1][columnIndex],
                board[2][columnIndex],
                board[3][columnIndex],
                board[4][columnIndex],
                board[5][columnIndex],
                board[6][columnIndex],
                board[7][columnIndex],
                board[8][columnIndex],
            }

            if hasRepetition(column) {
                return false
            }

            var square = square(board, rowIndex, columnIndex)

            if hasRepetition(square) {
                return false
            }
        }
    }
    return true
}

func hasRepetition(board []byte) bool {
    occurred := map[byte]bool{}
    for _, v := range board {
        if v == '.' { continue }
        if occurred[v] == true {
            return true
        } else {
            occurred[v] = true
        }
    }
    return false
}
