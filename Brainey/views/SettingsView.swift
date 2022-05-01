//
//  ContentView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-17.
//

import SwiftUI

struct SettingsView: View {
    
    @State var roundData = RoundData()
    @Binding var tabSelected: String
    @State var showQuestionsView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(K.backgroundImage)
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    CustomText(text: "Settings", size: 40, color: .blue)
                    
                    CustomSlider(value: $roundData.questionNum, minVal: 10, maxVal: 20, step: 1, description: "number of questions")
                    
                    CustomSlider(value: $roundData.difficulty, minVal: 1, maxVal: 4, step: 1, description: "difficulty")
                    
                    Spacer()
                    
                    NavigationLink {
                        QuestionsView(roundData: roundData)
                    } label: {
                        CustomText(text: "start", size: 30, color: .white)
                            .background(.pink).clipShape(Capsule())
                    }

                }
                
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    @State static var tabSelected: String = "Settigns"
    static var previews: some View {
        SettingsView(tabSelected: $tabSelected, showQuestionsView: false)
    }
}


