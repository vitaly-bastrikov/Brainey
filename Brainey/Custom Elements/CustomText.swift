//
//  CustomText.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-22.
//

import SwiftUI

struct CustomText: View {
    let text: String
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Text(text)
            .font(Font.custom(K.font, size: size))
            .foregroundColor(color)
            .padding()
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(text: "hello", size: 30, color: Color.blue)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
