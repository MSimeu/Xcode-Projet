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
    //Création et initialisation des boutons
    
    //Ligne 1
    var bouton11: Bouton? = nil
    var bouton12: Bouton? = nil
    var bouton13: Bouton? = nil
    var bouton14: Bouton? = nil
    var bouton15: Bouton? = nil
    
    //Ligne 2
    var bouton21: Bouton? = nil
    var bouton22: Bouton? = nil
    var bouton23: Bouton? = nil
    var bouton24: Bouton? = nil
    var bouton25: Bouton? = nil
    
    //Ligne 3
    var bouton31: Bouton? = nil
    var bouton32: Bouton? = nil
    var bouton33: Bouton? = nil
    var bouton34: Bouton? = nil
    var bouton35: Bouton? = nil
    
    //Ligne 4
    var bouton41: Bouton? = nil
    var bouton42: Bouton? = nil
    var bouton43: Bouton? = nil
    var bouton44: Bouton? = nil
    var bouton45: Bouton? = nil


    //Outlet pour chaque bouton
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
    
    //Melodie bouton
    @IBOutlet weak var btnMelo1: UIButton!
    @IBOutlet weak var btnMelo2: UIButton!
    @IBOutlet weak var btnMelo3: UIButton!
    @IBOutlet weak var btnMelo4: UIButton!
    @IBOutlet weak var btnMelo5: UIButton!
    
    //Melodie bouton
    @IBOutlet weak var btnVoix1: UIButton!
    @IBOutlet weak var btnVoix2: UIButton!
    @IBOutlet weak var btnVoix3: UIButton!
    @IBOutlet weak var btnVoix4: UIButton!
    @IBOutlet weak var btnVoix5: UIButton!
    
    // Booléen pour savoir si je bouton est active

    //Booléen
    var btn11Bool : Bool = false
    var btn12Bool : Bool = false
    var btn13Bool : Bool = false
    var btn14Bool : Bool = false
    var btn15Bool : Bool = false
    
    var btn21Bool : Bool = false
    var btn22Bool : Bool = false
    var btn23Bool : Bool = false
    var btn24Bool : Bool = false
    var btn25Bool : Bool = false
    
    var btn31Bool : Bool = false
    var btn32Bool : Bool = false
    var btn33Bool : Bool = false
    var btn34Bool : Bool = false
    var btn35Bool : Bool = false
    
    var btn41Bool : Bool = false
    var btn42Bool : Bool = false
    var btn43Bool : Bool = false
    var btn44Bool : Bool = false
    var btn45Bool : Bool = false
    
    //titre de la View
    @IBOutlet weak var titleLabel: UILabel!
    var titre : String = ""

    //Tableau de son de base ce sont les son Hip-Hop
    //Array
    var player1: [AVAudioPlayer:UIButton] = [:]
    var sound1: [String] = ["beat11","beat12","beat13","beat14","beat15"]
    var sound2: [String] = ["coeur1","coeur2","coeur3","coeur4","coeur5"]
    var sound3: [String] = ["melo1","melo2","melo3","melo4","melo5"]
    var sound4: [String] = ["voix1","voix2","voix3","voix4","voix5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initilisation des boutons
        boutoninit()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //intialisaion de la pages
        pageinit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageinit(){
        // le titre initilisation
        self.titre = ""
        
    }
    


    func boutoninit(){
        //initialisation du titre
        self.titleLabel.text = self.titre

        
        //initialisation des boutons
        // avec la Classe Bouton et donc avec comme pametre le boutton associer et le son
        //col1
        if (bouton11==nil){
            bouton11 = Bouton(btnBeat: self.btnBeat1, sound: self.sound1[0])
        }
        if (bouton12==nil){
            bouton12 = Bouton(btnBeat: self.btnBeat2, sound: self.sound1[1])
        }
        if (bouton13==nil){
            bouton13 = Bouton(btnBeat: self.btnBeat3, sound: self.sound1[2])
        }
        if (bouton14==nil){
            bouton14 = Bouton(btnBeat: self.btnBeat4, sound: self.sound1[3])
        }
        if (bouton15==nil){
            bouton15 = Bouton(btnBeat: self.btnBeat5, sound: self.sound1[4])
        }
        
        //col2
        if (bouton21==nil){
            bouton21 = Bouton(btnBeat: self.btnChorus1, sound: self.sound2[0])
        }
        if (bouton22==nil){
            bouton22 = Bouton(btnBeat: self.btnChorus2, sound: self.sound2[1])
        }
        if (bouton23==nil){
            bouton23 = Bouton(btnBeat: self.btnChorus3, sound: self.sound2[2])
        }
        if (bouton24==nil){
            bouton24 = Bouton(btnBeat: self.btnChorus4, sound: self.sound2[3])
        }
        if (bouton25==nil){
            bouton25 = Bouton(btnBeat: self.btnChorus5, sound: self.sound2[4])
        }
        
        //col3
        if (bouton31==nil){
            bouton31 = Bouton(btnBeat: self.btnMelo1, sound: self.sound3[0])
        }
        if (bouton32==nil){
            bouton32 = Bouton(btnBeat: self.btnMelo2, sound: self.sound3[1])
        }
        if (bouton33==nil){
            bouton33 = Bouton(btnBeat: self.btnMelo3, sound: self.sound3[2])
        }
        if (bouton34==nil){
            bouton34 = Bouton(btnBeat: self.btnMelo4, sound: self.sound3[3])
        }
        if (bouton35==nil){
            bouton35 = Bouton(btnBeat: self.btnMelo5, sound: self.sound3[4])
        }
        
        //col4
        if (bouton41==nil){
            bouton41 = Bouton(btnBeat: self.btnVoix1, sound: self.sound4[0])
        }
        if (bouton42==nil){
            bouton42 = Bouton(btnBeat: self.btnVoix2, sound: self.sound4[1])
        }
        if (bouton43==nil){
            bouton43 = Bouton(btnBeat: self.btnVoix3, sound: self.sound4[2])
        }
        if (bouton44==nil){
            bouton44 = Bouton(btnBeat: self.btnVoix4, sound: self.sound4[3])
        }
        if (bouton45==nil){
            bouton45 = Bouton(btnBeat: self.btnVoix5, sound: self.sound4[4])
        }



    
    }
    
    // lacement de la fonction play sound lors de l'action sur le Bouton
    @IBAction func btnBeat1(_ sender: Any) {
        
        
        if ( !self.btn11Bool ){
            self.btn11Bool = true
            
            bouton11?.playSound()
           
            
        }else{
            self.btn11Bool = false
            bouton11?.stopSound()
        }
    }
    
    @IBAction func btnBeat2(_ sender: Any){
        if ( !self.btn12Bool ){
            self.btn12Bool = true
            bouton12?.playSound()
            
        }else{
            self.btn12Bool = false
            bouton12?.stopSound()
        }
    }
    
   
    @IBAction func btnBeat3(_ sender: Any) {
        
        if ( !self.btn13Bool ){
            self.btn13Bool = true
            bouton13?.playSound()
            
        }else{
            self.btn13Bool = false
            bouton13?.stopSound()
        }
    }
    
    @IBAction func btnBeat4(_ sender: Any) {
        if ( !self.btn14Bool ){
            self.btn14Bool = true
            bouton14?.playSound()
            
        }else{
            self.btn14Bool = false
            bouton14?.stopSound()
        }
    }

    @IBAction func btnBeat5(_ sender: Any)  {
        if ( !self.btn15Bool ){
            self.btn15Bool = true
            bouton15?.playSound()
            
        }else{
            self.btn15Bool = false
            bouton15?.stopSound()
        }
    }
    
    //Choeur
    @IBAction func btnChorus1(_ sender: Any) {
        
        if ( !self.btn21Bool ){
            self.btn21Bool = true
            
            bouton21?.playSound()
            
            
        }else{
            self.btn21Bool = false
            bouton21?.stopSound()
        }

    }

    @IBAction func btnChorus2(_ sender: Any) {
        if ( !self.btn22Bool ){
            self.btn22Bool = true
            
            bouton22?.playSound()
            
            
        }else{
            self.btn22Bool = false
            bouton22?.stopSound()
        }
    }

    @IBAction func btnChorus3(_ sender: Any) {
        if ( !self.btn23Bool ){
            self.btn23Bool = true
            
            bouton23?.playSound()
            
            
        }else{
            self.btn23Bool = false
            bouton23?.stopSound()
        }
    }
    
    @IBAction func btnChorus4(_ sender: Any) {
        if ( !self.btn24Bool ){
            self.btn24Bool = true
            
            bouton24?.playSound()
            
            
        }else{
            self.btn24Bool = false
            bouton24?.stopSound()
        }
    }
    
    @IBAction func btnChorus5(_ sender: Any) {
        if ( !self.btn25Bool ){
            self.btn25Bool = true
            
            bouton25?.playSound()
            
            
        }else{
            self.btn25Bool = false
            bouton25?.stopSound()
        }
    }
    

    
    //Melodies
    
    @IBAction func btnMelo1(_ sender: Any) {
        if ( !self.btn31Bool ){
            self.btn31Bool = true
            
            bouton31?.playSound()
            
            
        }else{
            self.btn31Bool = false
            bouton31?.stopSound()
        }

    }
 
    @IBAction func btnMelo2(_ sender: Any) {
        if ( !self.btn32Bool ){
            self.btn32Bool = true
            
            bouton32?.playSound()
            
            
        }else{
            self.btn32Bool = false
            bouton32?.stopSound()
        }

    }
    
    @IBAction func btnMelo3(_ sender: Any) {
        
        if ( !self.btn33Bool ){
            self.btn33Bool = true
            
            bouton33?.playSound()
            
            
        }else{
            self.btn33Bool = false
            bouton33?.stopSound()
        }

    }
    
    @IBAction func btnMelo4(_ sender: Any) {
        if ( !self.btn34Bool ){
            self.btn34Bool = true
            
            bouton34?.playSound()
            
            
        }else{
            self.btn34Bool = false
            bouton34?.stopSound()
        }

    }
 
    
    @IBAction func btnMelo5(_ sender: Any) {
        if ( !self.btn35Bool ){
            self.btn35Bool = true
            
            bouton35?.playSound()
            
            
        }else{
            self.btn35Bool = false
            bouton35?.stopSound()
        }

    }
    
    
    
    //Voix
    @IBAction func btnVoix1(_ sender: Any) {
        
        if ( !self.btn41Bool ){
            self.btn41Bool = true
            
            bouton41?.playSound()
            
            
        }else{
            self.btn41Bool = false
            bouton41?.stopSound()
        }

    }
    
    @IBAction func btnVoix2(_ sender: Any) {
        
        if ( !self.btn42Bool ){
            self.btn42Bool = true
            
            bouton42?.playSound()
            
            
        }else{
            self.btn42Bool = false
            bouton42?.stopSound()
        }
    }

    
    @IBAction func btnVoix3(_ sender: Any) {
        
        if ( !self.btn43Bool ){
            self.btn43Bool = true
            
            bouton43?.playSound()
            
            
        }else{
            self.btn43Bool = false
            bouton43?.stopSound()
        }
    }
    
    @IBAction func btnVoix4(_ sender: Any) {
        if ( !self.btn44Bool ){
            self.btn44Bool = true
            
            bouton44?.playSound()
            
            
        }else{
            self.btn44Bool = false
            bouton44?.stopSound()
        }
    }
    
    @IBAction func btnVoix5(_ sender: Any) {
        if ( !self.btn45Bool ){
            self.btn45Bool = true
            
            bouton45?.playSound()
            
            
        }else{
            self.btn45Bool = false
            bouton45?.stopSound()
        }
    }
    

    @IBAction func playerStop(_ sender: Any) {
        
        //Fonction qui permet de stoper tout les boutons
        //col1
        bouton11?.stopSound()
        bouton12?.stopSound()
        bouton13?.stopSound()
        bouton14?.stopSound()
        bouton15?.stopSound()
        
        bouton21?.stopSound()
        bouton22?.stopSound()
        bouton23?.stopSound()
        bouton24?.stopSound()
        bouton25?.stopSound()
        
        bouton31?.stopSound()
        bouton32?.stopSound()
        bouton33?.stopSound()
        bouton34?.stopSound()
        bouton35?.stopSound()
        
        bouton41?.stopSound()
        bouton42?.stopSound()
        bouton43?.stopSound()
        bouton44?.stopSound()
        bouton45?.stopSound()

    }
    
    
    

}
