// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/564/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var boughtPrice: Int?
        var profit: Int = 0
        
        for i in 0..<prices.count {
            
            let current = prices[i]
            
            if let price = boughtPrice {
             
                // corner case - end of the array
                if i == prices.count - 1 {
                    profit += current - price
                    break
                }
                
                if price < current {
                    
                    // corner case, next price is even better
                    if current < prices[i + 1] {
                        continue
                    }
                    
                    profit += current - price
                    boughtPrice = nil
                }
            } else if i < prices.count - 1 {
                if current < prices[i + 1] {
                    boughtPrice = current
                }
            }
        }
        
        return profit
    }
}

// faster

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var profit = 0
        
        for i in 1..<prices.count {
            let prev = prices[i - 1]
            let current = prices[i]
            
            if current > prev {
                profit += current - prev
            }
        }
        
        return profit
    }
}
