//
//  Bouton.swift
//  TapMusics
//
//  Created by MENES SIMEU on 21/12/2016.
//  Copyright © 2016 MenesS. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Bouton: NSObject , AVAudioPlayerDelegate {
    var audioPlayerBtn:AVAudioPlayer! = nil
    var btnBeat: UIButton!
    var sound : String!
    
  
    
    init(btnBeat: UIButton  , sound : String ) {
        
        self.btnBeat = btnBeat
        self.sound = sound
        

    }
    
    func playSound () {

            self.audioPlayerBtn = AVAudioPlayer ()
        
            self.btnBeat.alpha = 0.5
            let audioFilePath = Bundle.main.url(forResource: self.sound, withExtension: "mp3")!
            var error: NSError?
            //lancement
            do {
                audioPlayerBtn = try AVAudioPlayer(contentsOf: audioFilePath)
                
                
            } catch let error1 as NSError {
                error = error1
                self.audioPlayerBtn = nil
                print(error?.localizedDescription ?? "Raté")
            }
        
            if error == nil {
                self.audioPlayerBtn.delegate = self
                self.audioPlayerBtn.numberOfLoops = -1
                self.audioPlayerBtn.prepareToPlay()
                self.audioPlayerBtn.play()
                
                print(audioPlayerBtn.numberOfLoops)
                
        }
        
    
    }
    
    
    
    func stopSound (){
        
        self.btnBeat.alpha = 1.0
        if((self.audioPlayerBtn != nil) && self.audioPlayerBtn.play()){

            self.audioPlayerBtn.stop()
            
        }
    
    }


}
