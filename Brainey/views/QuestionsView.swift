//
//  QuestionsView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-18.
//

import SwiftUI
import AVKit

struct QuestionsView: View {
    @ObservedObject var roundData: RoundData = RoundData()
    @State var audioPlayer: AVAudioPlayer!
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(K.backgroundImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            roundData.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CustomText(text: UtilsManager.timeToString(roundData.time), size: 40, color: .black)
                    .onReceive(timer) { _ in
                        roundData.time += 1
                    }
                CustomText(text: roundData.question.text, size: 40, color: .blue)
                HStack {
                    
                    CustomTextField(userInput: $roundData.userAnswer)
                    
                    Button {
                        let questionManager = QuestionManager(roundData: roundData, audioPlayer: $audioPlayer)
                        questionManager.checkAnswer()
                        updateQuestionsView()
                        if (roundData.questionsPassed == Int(roundData.questionNum) - 1) {
                            completeRound()
                        }
                        
                    } label: {
                        CustomText(text: "Next", size: 30, color: .white)
                            .frame(width: 120, height: 60, alignment: .center).background(.blue).clipShape(Capsule())
                    }
                    NavigationLink("", isActive: $roundData.showResultsView) {
                        ResultsView(roundData: roundData)
                    }
                }
                ProgressView("", value: Float(roundData.questionsPassed), total: Float(roundData.questionNum))
                    .frame(width: 400, alignment: .center)
                Spacer()
            }
            roundData.backgroundColor.edgesIgnoringSafeArea(.all)
            CustomText(text: String(roundData.countdownText), size: 90, color: .white)
        }
//        .navigationBarHidden(true)
        .onAppear {
            startCountdown()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
                resetQuestionView()
            }
        }
    }
    func completeRound() {
        roundData.showResultsView = true
        FirestoreManager.saveData(
            QuestionManager.getTimePerQuestion(roundData.time, roundData.questionNum),
            QuestionManager.getRatio(roundData.questionNum, roundData.score)
        )
        roundData.isTimerRunning = false
        
    }
    
    func updateQuestionsView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            roundData.question = QuestionGenerator.generateQuestion(roundData.difficulty)
            roundData.backgroundColor = .clear
            roundData.questionsPassed += 1
            roundData.userAnswer = ""
        }
    }
    func resetQuestionView() {
        roundData.question = QuestionGenerator.generateQuestion(roundData.difficulty)
        roundData.backgroundColor = .clear
        roundData.countdownText = ""
        roundData.questionsPassed = 0
        roundData.time = 0
        roundData.score = 0
        roundData.isTimerRunning = true
    }
    func startCountdown() {
        let soundManager = SoundManager(audioPlayer: $audioPlayer)
        soundManager.playCountdownSound()
        for i in 1...2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) + 0.3) {
            roundData.countdownText = String(3 - i)
            }
        }
    }

}





struct QuestionsView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer!
    static var previews: some View {
        QuestionsView()
    }
}



