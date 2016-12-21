//
//  ViewController.swift
//  TapMusics
//
//  Created by MENES SIMEU on 15/12/2016.
//  Copyright © 2016 MenesS. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController , AVAudioPlayerDelegate {
    //controller
    var bouton1: Bouton? = nil
    var bouton2: Bouton? = nil
    var bouton3: Bouton? = nil
    var bouton4: Bouton? = nil
    var bouton5: Bouton? = nil

   
    
    //Audio player
    var audioPlayerBtn1:AVAudioPlayer!
    var audioPlayerBtn2:AVAudioPlayer!
    var audioPlayerBtn3:AVAudioPlayer!
    var audioPlayerBtn4:AVAudioPlayer!
    var audioPlayerBtn5:AVAudioPlayer!
    
    //beat bouton
    @IBOutlet weak var btnBeat1: UIButton!
    @IBOutlet weak var btnBeat2: UIButton!
    @IBOutlet weak var btnBeat3: UIButton!
    @IBOutlet weak var btnBeat4: UIButton!
    @IBOutlet weak var btnBeat5: UIButton!

    //Chorus bouton
    @IBOutlet weak var btnChorus1: UIButton!
    @IBOutlet weak var btnChorus2: UIButton!
    @IBOutlet weak var btnChorus3: UIButton!
    @IBOutlet weak var btnChorus4: UIButton!
    @IBOutlet weak var btnChorus5: UIButton!
    
    
    //Booléen
    var btn1Bool : Bool = false
    var btn2Bool : Bool = false
    var btn3Bool : Bool = false
    var btn4Bool : Bool = false
    var btn5Bool : Bool = false
    
    //Array
    var player1: [AVAudioPlayer:UIButton] = [:]
    var sound1: [String] = ["beat11","beat12","beat13","beat14","beat15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (bouton1==nil){
            bouton1 = Bouton(btnBeat: self.btnBeat1, sound: self.sound1[0])
        }
        if (bouton2==nil){
            bouton2 = Bouton(btnBeat: self.btnBeat2, sound: self.sound1[1])
        }
        if (bouton3==nil){
            bouton3 = Bouton(btnBeat: self.btnBeat3, sound: self.sound1[2])
        }
        if (bouton4==nil){
            bouton4 = Bouton(btnBeat: self.btnBeat4, sound: self.sound1[3])
        }
        if (bouton5==nil){
            bouton5 = Bouton(btnBeat: self.btnBeat5, sound: self.sound1[4])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
    
    @IBAction func btnBeat1(_ sender: Any) {
        
        
        if ( !self.btn1Bool ){
            self.btn1Bool = true
            
            bouton1?.playSound()
           
            
        }else{
            self.btn1Bool = false
            bouton1?.stopSound()
        }
    }
    
    @IBAction func btnBeat2(_ sender: Any){
        if ( !self.btn2Bool ){
            self.btn2Bool = true
            bouton2?.playSound()
            
        }else{
            self.btn2Bool = false
            bouton2?.stopSound()
        }
    }
    
   
    @IBAction func btnBeat3(_ sender: Any) {
        
        if ( !self.btn3Bool ){
            self.btn3Bool = true
            bouton3?.playSound()
            
        }else{
            self.btn3Bool = false
            bouton3?.stopSound()
        }
    }
    
    @IBAction func btnBeat4(_ sender: Any) {
        if ( !self.btn4Bool ){
            self.btn4Bool = true
            bouton4?.playSound()
            
        }else{
            self.btn4Bool = false
            bouton4?.stopSound()
        }
    }

    @IBAction func btnBeat5(_ sender: Any)  {
        if ( !self.btn5Bool ){
            self.btn5Bool = true
            bouton5?.playSound()
            
        }else{
            self.btn5Bool = false
            bouton5?.stopSound()
        }
    }
    


    @IBAction func playerStop(_ sender: Any) {
        
        bouton1?.stopSound()
        bouton2?.stopSound()
        bouton3?.stopSound()
        bouton4?.stopSound()
        bouton5?.stopSound()

    }
    
    

}
