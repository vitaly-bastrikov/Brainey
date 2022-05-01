//
//  StatisticView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-21.
//

import SwiftUI
import Firebase

struct StatisticView: View {
    
    @State var userResults = [UserResult]()
    
    
    var body: some View {
        NavigationView {
            VStack {
                CustomText(text: "Results", size: 40, color: .blue)
                Spacer()
                
                CustomText(text: "correctness", size: 20, color: .black)
                    .frame(width: 400, height: 50, alignment: .leading)
                BarChart(data: userResults.map {$0.ratio}, text: "%", goodColor: .blue, badColor: .red)
                Divider()
                
                CustomText(text: "time per question", size: 20, color: .black)
                    .frame(width: 400, height: 50, alignment: .leading)
                BarChart(data: userResults.map {$0.time}, text: "sec", goodColor: .red, badColor: .blue)
                Spacer()
                
                NavigationLink {
                    StatisticDetailView()
                } label: {
                    CustomText(text: "Details", size: 30, color: .white)
                        .background(.pink).clipShape(Capsule())
                }
                
            }
        }
        .onAppear {
            userResults = []
            let firestoreManager = FirestoreManager(userResults: $userResults)
            firestoreManager.updateStatisticView(reverse: true)
        }
    }
    
    
    struct StatisticView_Previews: PreviewProvider {
        static var previews: some View {
            StatisticView()
        }
    }
}
struct StatisticCell: View {
    let text: String
    let val: String
    
    var body: some View {
        HStack() {
            CustomText(text: text, size: 20, color: .blue)
                .frame(width: 250, height: 30, alignment: .leading)
            CustomText(text: val, size: 20, color: .pink)
                .frame(width: 100, height: 30, alignment: .trailing)
        }
    }
}

