//
//  BarChart.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-30.
//

import SwiftUI

struct BarChart: View {
    let data: [Int]
    let text: String
    let goodColor: Color
    let badColor: Color
    
    
    var body: some View {
        let maxVal = data.max() ?? 50
        
        
        ScrollViewReader { reader in
            ScrollView(.horizontal) {
                GeometryReader { gr in
                    VStack {
                        HStack(alignment: .bottom, spacing: 5) {
                            ForEach(data, id: \.self) { value in
                                let width = CGFloat(50)
                                let heigt = gr.size.height * CGFloat(value) / CGFloat(maxVal) * 0.6
                                Bar(width: width, heigt: heigt, value: value, maxVal: maxVal, text: text, goodColor: goodColor, badColor: badColor)
                            }
                        }
                    }
                }
                .frame(alignment: .bottom)
                .onAppear {
                    reader.scrollTo(data.count - 1)
                }
            }
        }
        .onAppear {
            print("data: \(data)")
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static let data = [72, 56, 31,67,87,12,64,12,98,100]
    static var previews: some View {
        BarChart(data: data, text: "%", goodColor: .blue, badColor: .red)
    }
}

struct Bar: View {
    let width: CGFloat
    let heigt: CGFloat
    let value: Int
    let maxVal: Int
    let text: String
    let goodColor: Color
    let badColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .fill(value > maxVal / 2 ? goodColor : badColor)
                .frame(width: width, height: heigt, alignment: .center)
            CustomText(text: "\(value) \(text)", size: 18, color: .black)
        }
        .frame(width: 60)
        
    }
}

//ratio
