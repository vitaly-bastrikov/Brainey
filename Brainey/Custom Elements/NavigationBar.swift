//
//  NavigationBar.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-22.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var showSettings: Bool
    @Binding var showQuestions: Bool
    @Binding var showResults: Bool
    @Binding var showStatistic: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color(red: 0, green: 0, blue: 1, opacity: 0.1))
                .frame(height: 80, alignment: .center)
                .overlay {
                    HStack(alignment: .bottom, spacing: 30) {
                        NavigationButton()
                        NavigationButton()
                    }
                    .padding()
                }
            showSettings = false
            showQuestions = false
            showResults = false
            showStatistic = false
            viewSelected = true
        }
    }
}


struct NavigationBar_Previews: PreviewProvider {
    @State static var showSettings: Bool = true
    @State static var showQuestions: Bool = false
    @State static var showResults: Bool = false
    @State static var showStatistic: Bool = false
    
    static var previews: some View {
        NavigationBar(showSettings: $showSettings, showQuestions: $showQuestions, showResults: $showResults, showStatistic: $showStatistic)
    }
}

struct NavigationButton: View {
    @Binding var viewSelected: Bool
    let text: String
    var body: some View {
        Button {
            
        } label: {
            Text(text)
        }

    }

}










