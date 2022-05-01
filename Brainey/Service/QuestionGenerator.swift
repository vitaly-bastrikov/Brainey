//
//  QuestionGenerator.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-18.
//

import Foundation

struct QuestionGenerator {

    
    static func generateQuestion(_ difficulty: Double) -> QuestionModel {
        
        let digitNum = Int(1 + difficulty)
        var answer = 0
        var digits = [Int]()
        
        for _ in 1...digitNum {
            let sign = Bool.random()
            var curr = Int.random(in: 1...5) * Int(difficulty)
            if (!sign) {
                curr *= -1
            }
            digits.append(curr)
            answer += curr
        }
        
        var text = ""
        for digit in digits {
            if (digit < 0) {
                text += String(digit)
            }
            else if (digit > 0) {
                text += "+" + String(digit)
            }
        }
        if (text.starts(with: "+")) {
            text.remove(at: text.startIndex)
        }
        return QuestionModel(text: text, answer: abs(answer))

    }
}
    
struct QuestionModel {
    let text: String
    let answer: Int
}

