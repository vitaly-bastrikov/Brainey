//
//  StatisticDetailsView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-05-01.
//

import SwiftUI

struct StatisticDetailView: View {
    
    @State var userResults = [UserResult]()
    
    var body: some View {
        VStack{
            CustomText(text: "Statistic Details", size: 20, color: .blue)
            ScrollView {
                ScrollViewReader { scrollView in
                    ForEach(userResults, id: \.id) { result in
                        VStack(spacing: 0) {
                            CustomText(text: result.date, size: 20, color: .black)
                                .frame(height: 30, alignment: .center)
                            StatisticCell(text: "time per question", val: "\(result.time) sec")
                            StatisticCell(text: "correctness", val: "\(result.ratio)%")
                            Divider().background(.gray)
                        }
                    }
                    .onAppear {
                        scrollView.scrollTo(userResults.first?.id)
                        userResults = []
                        let firestoreManager = FirestoreManager(userResults: $userResults)
                        firestoreManager.updateStatisticView(reverse: true)
                    }
                }
            }
        }
    }
}

struct StatisticDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticDetailView()
    }
}
