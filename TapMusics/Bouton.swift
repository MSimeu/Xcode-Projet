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
//
//  Class Bouton
//
class Bouton: NSObject , AVAudioPlayerDelegate {
    var audioPlayerBtn:AVAudioPlayer! = nil
    var btnBeat: UIButton!
    var sound : String!
    
  
    //constructeur
    init(btnBeat: UIButton  , sound : String ) {
        
        self.btnBeat = btnBeat
        self.sound = sound
        

    }
    
    
    //fonction qui joue le son
    func playSound () {
        
        
            //Création de l'audio player associer au bouton
            self.audioPlayerBtn = AVAudioPlayer ()
            // le bouton devien un peu trasparent lorsqu'il est activé
            self.btnBeat.alpha = 0.5
            //Création du chemin vers le fichier audio
            let audioFilePath = Bundle.main.url(forResource: self.sound, withExtension: "mp3")!
            // variable qui contiendra l'erreur
            var error: NSError?
        
            // fonction qui jouer le son
            //lancement
            do {
                //ajout du chemin vers le son a l'audio player 
                audioPlayerBtn = try AVAudioPlayer(contentsOf: audioFilePath)
                
                
            } catch let error1 as NSError {
                //En cas d'erreur
                error = error1
                //suppresion de l'audio player pour ne plus qu'il y est d'erreur
                self.audioPlayerBtn = nil
                
                //print(error?.localizedDescription ?? "Raté")
            }
        
            // si il n'y a aucune erreur
            if error == nil {
                // assigning the delegate to the buton
                self.audioPlayerBtn.delegate = self
                //nombre de loop =-1 => boucle infini
                self.audioPlayerBtn.numberOfLoops = -1
                //preparation du player
                self.audioPlayerBtn.prepareToPlay()
                //jouer le son
                self.audioPlayerBtn.play()
                
                //print(audioPlayerBtn.numberOfLoops)
                
        }
        
    
    }
    
    
    //
    // Fonction pour stoper le son
    func stopSound (){
        //  la couleur du bouton redevien net
        self.btnBeat.alpha = 1.0
        // si c'est possible , que le player joue bien le son
        if((self.audioPlayerBtn != nil) && self.audioPlayerBtn.play()){
            //arret du son
            self.audioPlayerBtn.stop()
            
        }
    
    }
    
    // fonction qui renvien true ou false si le pleyr joue bien un son
    func isPlaying() -> Bool {
        if(self.audioPlayerBtn.isPlaying){
            
            return true
            
        }else{
            return false
        }
    
    
    }


}
