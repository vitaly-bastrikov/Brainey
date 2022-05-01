//
//  RoundOutput.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-23.
//

import Foundation
import SwiftUI

class RoundData: ObservableObject {

    @Published var score: Int = 0
    @Published var time: Int = 0
    @Published var backgroundColor: Color = .blue
    @Published var questionsPassed: Int = 0
    @Published var userAnswer: String = ""
    @Published var question: QuestionModel = QuestionGenerator.generateQuestion(2)
    @Published var showResultsView: Bool = false
    @Published var countdownText: String = "3"
    @Published var isTimerRunning = false
    @Published var questionNum: Double = 15
    @Published var difficulty: Double = 2

}
