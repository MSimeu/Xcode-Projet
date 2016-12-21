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

    
    //Booléen
    var btn1Bool : Bool = false
    var btn2Bool : Bool = false
    var btn3Bool : Bool = false
    var btn4Bool : Bool = false
    var btn5Bool : Bool = false
    
    //Array
    var player1: [AVAudioPlayer:UIButton] = [:]
    var sound1: [String] = ["beat1","beat2","beat3","beat","beat5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //initBoard()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    @IBAction func btnBeat1(_ sender: Any) {
        if ( !btn1Bool ){
            btn1Bool = true
            btnBeat1.alpha = 0.5
            let audioFilePath1 = Bundle.main.url(forResource: sound1[0], withExtension: "mp3")!
            var error: NSError?
            
            do {
                self.audioPlayerBtn1 = try AVAudioPlayer(contentsOf: audioFilePath1)
            } catch let error1 as NSError {
                error = error1
                self.audioPlayerBtn1 = nil
                print(error?.localizedDescription ?? "Raté")
            }
            if error == nil {
                self.audioPlayerBtn1.play()

            }
        
        }else{
            btn1Bool = false
            btnBeat1.alpha = 1.0
            if(self.audioPlayerBtn1.play()){
                self.audioPlayerBtn1.stop()
            
            }
        
        }
    }
    @IBAction func btnBeat2(_ sender: Any){
        if ( !btn2Bool ){
            btn2Bool = true
            btnBeat2.alpha = 0.5
            let audioFilePath2 = Bundle.main.url(forResource: sound1[1], withExtension: "mp3")!
            var error: NSError?
            
            do {
                self.audioPlayerBtn2 = try AVAudioPlayer(contentsOf: audioFilePath2)
            } catch let error2 as NSError {
                error = error2
                self.audioPlayerBtn1 = nil
                print(error?.localizedDescription ?? "Raté")
            }
            if error == nil {
                self.audioPlayerBtn2.play()
                
            }
            
        }else{
            btn2Bool = false
            btnBeat2.alpha = 1.0
            if(self.audioPlayerBtn2.play()){
                self.audioPlayerBtn2.stop()
                
            }
            
        }    }
    
   
    @IBAction func btnBeat3(_ sender: Any) {
        
        if ( !btn3Bool ){
            btn3Bool = true
            btnBeat3.alpha = 0.5
            let audioFilePath3 = Bundle.main.url(forResource: sound1[2], withExtension: "mp3")!
            var error: NSError?
            
            do {
                self.audioPlayerBtn3 = try AVAudioPlayer(contentsOf: audioFilePath3)
            } catch let error3 as NSError {
                error = error3
                self.audioPlayerBtn3 = nil
                print(error?.localizedDescription ?? "Raté")
            }
            if error == nil {
                
                self.audioPlayerBtn3.play()
                
            }
            
        }else{
            btn3Bool = false
            btnBeat3.alpha = 1.0
            if(self.audioPlayerBtn3.play()){
                self.audioPlayerBtn3.stop()
                
            }
            
        }    }
    
    @IBAction func btnBeat4(_ sender: Any) {
        if ( !btn4Bool ){
            btn4Bool = true
            btnBeat4.alpha = 0.5
            let audioFilePath4 = Bundle.main.url(forResource: sound1[4], withExtension: "mp3")!
            var error: NSError?
            
            do {
                self.audioPlayerBtn4 = try AVAudioPlayer(contentsOf: audioFilePath4)
            } catch let error4 as NSError {
                error = error4
                self.audioPlayerBtn4 = nil
                print(error?.localizedDescription ?? "Raté")
            }
            if error == nil {
                self.audioPlayerBtn4.play()
                
            }
            
        }else{
            btn4Bool = false
            btnBeat4.alpha = 1.0
            if(self.audioPlayerBtn4.play()){
                self.audioPlayerBtn4.stop()
                
            }
            
        }    }

    @IBAction func btnBeat5(_ sender: Any)  {
        if ( !btn5Bool ){
            btn5Bool = true
            btnBeat5.alpha = 0.5
            let audioFilePath5 = Bundle.main.url(forResource: sound1[4], withExtension: "mp3")!
            var error: NSError?
            
            do {
                self.audioPlayerBtn5 = try AVAudioPlayer(contentsOf: audioFilePath5)
            } catch let error5 as NSError {
                error = error5
                self.audioPlayerBtn5 = nil
                print(error?.localizedDescription ?? "Raté")
            }
            if error == nil {
                self.audioPlayerBtn5.play()
                
            }
            
        }else{
            btn5Bool = false
            btnBeat5.alpha = 1.0
            if(self.audioPlayerBtn5.play()){
                self.audioPlayerBtn5.stop()
                
            }
            
        }
    }
    


    @IBAction func playerStop(_ sender: Any) {
        
        if((self.audioPlayerBtn1 != nil) && self.audioPlayerBtn1.play()){
            btn1Bool = false
            btnBeat1.alpha = 1.0
            self.audioPlayerBtn1.stop()
            
        }

        if((self.audioPlayerBtn2 != nil) && self.audioPlayerBtn2.play()){
            btn2Bool = false
            btnBeat2.alpha = 1.0
            self.audioPlayerBtn2.stop()
            
        }

        if((self.audioPlayerBtn3 != nil) && self.audioPlayerBtn3.play()){
            btn3Bool = false
            btnBeat3.alpha = 1.0
            self.audioPlayerBtn3.stop()
            
        }
        if((self.audioPlayerBtn4 != nil) && self.audioPlayerBtn4.play()){
            btn4Bool = false
            btnBeat4.alpha = 1.0
            self.audioPlayerBtn4.stop()
            
        }
        if((self.audioPlayerBtn5 != nil) && self.audioPlayerBtn5.play()){
            btn5Bool = false
            btnBeat5.alpha = 1.0
            self.audioPlayerBtn5.stop()
            
        }
   

    }
    
    

}
