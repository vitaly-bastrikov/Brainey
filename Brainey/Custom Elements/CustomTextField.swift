//
//  CustomTextField.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var userInput: String
    
    
    var body: some View {
        
        TextField("", text: $userInput)
            .frame(width: 120, height: 60, alignment: .center)
            .font(Font.custom("Marker Felt", size: 30))
            .foregroundColor(K.blueColor)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 80)
                    .stroke(Color.blue, lineWidth: 4))
    }
    
}

struct CustomTextField_Previews: PreviewProvider {
    
    @State static var myUserInput: String = "20"
    static var previews: some View {
        CustomTextField(userInput: $myUserInput)
            .previewLayout(.sizeThatFits)
    }
}
