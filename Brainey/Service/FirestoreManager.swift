//
//  FirestoreManager.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-30.
//

import SwiftUI
import Firebase

struct FirestoreManager {
    
    static func saveData(_ time: Int, _ ratio: Int) {
        let db = Firestore.firestore()
        
        db.collection("userResults").addDocument(data: [
            "time": time,
            "ratio": ratio,
            "date" : UtilsManager.getTime(),
            "systemTime": Date().timeIntervalSince1970
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    @Binding var userResults: [UserResult]
    func updateStatisticView(reverse: Bool){

        Firestore.firestore().collection("userResults")
            .order(by: "systemTime", descending: reverse)
//            .limit(to: 15)
            .addSnapshotListener { documentSnapshot, error in
                if let documents = documentSnapshot?.documents {
                    for document in documents {
                        let data = document.data()
                        let ratio = data["ratio"] as? Int ?? 50
                        let time = data["time"] as? Int ?? 1
                        let date = data["date"] as? String ?? "01 January"
                        
                        userResults.append(UserResult(ratio: ratio, time: time, date: date))
                    }
                    print("userResults loaded: \(userResults)")
                }
            }
    }
}
