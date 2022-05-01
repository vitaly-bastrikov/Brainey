import SwiftUI

struct UserResult: Identifiable {
    var id: String = UUID().uuidString
    let ratio: Int
    let time: Int
    let date: String
    
}
