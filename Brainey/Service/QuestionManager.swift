//
//  QuestionManager.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-05-01.
//

import SwiftUI
import AVKit

struct QuestionManager {
    @ObservedObject var roundData: RoundData
    @Binding var audioPlayer: AVAudioPlayer!
    
    static func getTimePerQuestion(_ time: Int, _ questionNum: Double) -> Int {
        return questionNum == 0 ? 0 : time / Int(questionNum)
    }
    
    static func getRatio(_ questionNum: Double, _ score: Int) -> Int {
        let res = questionNum == 0 ? 1 : Float(score) / Float(questionNum)
        return Int(round(res * 100)/1)
    }
    
    
    func checkAnswer() {
        let soundManager = SoundManager(audioPlayer: $audioPlayer)
        if let answer = Int(roundData.userAnswer) {
            if (answer == roundData.question.answer) {
                roundData.score += 1
                roundData.backgroundColor = .green.opacity(0.2)
                soundManager.playCorrectSound()
                print("correct")
            }
            else {
                roundData.backgroundColor = .red.opacity(0.2)
                soundManager.playWrongSound()
                print("wrong")
            }
            print("score: \(roundData.score)")
        }

    }
}
