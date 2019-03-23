import Foundation
import AVFoundation
import UIKit

public class MusicPlayer {
    public static var audioPlayer: AVAudioPlayer?
    
    
    public static func play() {

        let sound = Bundle.main.path(forResource: "Mountainside_Looping", ofType: "mp3")
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = 0
            audioPlayer.play()
            print("playing")
            MusicPlayer.audioPlayer = audioPlayer
        }
        catch {
            print("error")
        }
    }
}
