//
//  ResultsView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-24.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var appState: AppState

    let roundData: RoundData
    
    var body: some View {
        ZStack {
            Image(K.backgroundImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                CustomText(text: "Results", size: 40, color: .blue)
                VStack {
                    ResultCell(text: "score", val: roundData.score)
                    ResultCell(text: "questions", val: Int(roundData.questionNum))
                    ResultCell(
                        text: "time",
                        val: UtilsManager.timeToString(roundData.time))
                    ResultCell(
                        text: "time per question",
                        val: "\(QuestionManager.getTimePerQuestion(roundData.time, roundData.questionNum)) sec")
                    ResultCell(
                        text: "correctness",
                        val: "\(QuestionManager.getRatio(roundData.questionNum, roundData.score)) %")
                }
                Button {
                    appState.rootViewId = UUID()
                } label: {
                    CustomText(text: "try again", size: 30, color: .white)
                        .background(.pink).clipShape(Capsule())
                }

            }
            
        }
    }
    struct ResultCell: View {
        let text: String
        let val: Any
        var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .padding()
                .overlay {
                    HStack {
                        CustomText(text: text, size: 20, color: .black)
                            .frame(width: 200, height: 50, alignment: .leading)
                        CustomText(text: String(describing: val), size: 25, color: .blue)
                            .frame(width: 100, height: 50, alignment: .trailing)
                    }
                    .frame(width: 400, alignment: .center)
                }
            
        }
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(roundData: RoundData())
    }
}





