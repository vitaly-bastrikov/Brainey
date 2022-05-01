//
//  TestView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-22.
//

import SwiftUI


struct CustomSlider: View {
    
    @Binding var value: Double
    @State var isEditing: Bool = false
    
    let minVal: Double
    let maxVal: Double
    let step: Double
    let description: String
    
    
    
    var body: some View {
        VStack{
            
            HStack {
                Text(description)
                    .foregroundColor(.blue)
                    .font(Font.custom(K.font, size: 25))
                
                Text("\(Int(value))")
                        .font(.custom(K.font, size: 30))
                        .foregroundColor(isEditing ? .red : .blue)
                        .padding()
            }
        
            
            Slider(value: $value, in: minVal...maxVal, step: step) {
        } minimumValueLabel: {
            Text("\(Int(minVal))")
                .font(.custom(K.font, size: 20))
                .padding()
        } maximumValueLabel: {
            Text("\(Int(maxVal))")
                .font(.custom(K.font, size: 20))
                .padding()
        } onEditingChanged: { editing in
            isEditing = editing
            print("value: \(value)")
        }
        .tint(.blue)
        .frame(width: 400, height: 50, alignment: .center)
            
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    @State static var value: Double = 15
    static var previews: some View {
        CustomSlider(value: $value, isEditing: false, minVal: 10.0, maxVal: 20.0, step: 1.0, description: "haha")
            
    }
    
}
