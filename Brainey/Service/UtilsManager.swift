//
//  Utils.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-22.
//

import Foundation
import SwiftUI
import Firebase
import AVKit

struct UtilsManager {
    @ObservedObject var roundData: RoundData


    
    static func getTime()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
         
        let date = Date()
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date) // Jan 2, 2001
        
    }
    
    static func timeToString(_ time: Int) -> String {
        let minString = (time / 60) < 10 ? "0" + String(time / 60) : String(time / 60)
        let secString = (time % 60) < 10 ? "0" + String(time % 60) : String(time % 60)
        return minString + ":" + secString
    }
    
    
    
    
    
}
