//
//  SoundManager.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-27.
//

import Foundation
import AVKit
import SwiftUI

struct SoundManager {
    @Binding var audioPlayer: AVAudioPlayer!
    
     func playCountdownSound(){
        let sound = Bundle.main.path(forResource: "countdown", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.play()
    }
    func playCorrectSound(){
        let sound = Bundle.main.path(forResource: "correctSound", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.play()
    }
    func playWrongSound(){
        let sound = Bundle.main.path(forResource: "wrongSound", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.play()
    }
    
}


