//
//  BackgroundViewController.swift
//  TapMusics
//
//  Created by MENES SIMEU on 13/01/2017.
//  Copyright © 2017 MenesS. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Bouton pour chaque outlet
    //BTN
    @IBOutlet weak var choice1outlet: UIButton!
    @IBOutlet weak var choice2outlet: UIButton!
    @IBOutlet weak var choice3outlet: UIButton!
    @IBOutlet weak var photooutlet: UIButton!
    //IMAGEVIEW
    @IBOutlet weak var ImageChoice: UIImageView?
    
    
    //Imagecontroller
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //modification de la transparence des bouton non selectionné
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 0.5
        // asign the delegate to UIImagePickerController
        imagePicker.delegate = self
        // création d'un UITapGestureRecognizer pour valider la selection
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        // actictiver l'interaction
        ImageChoice?.isUserInteractionEnabled = true
        //ajout du gesture reconiser
        ImageChoice?.addGestureRecognizer(tapGestureRecognizer)

        // Do any additional setup after loading the view.
    }
    
    func imageTapped(img: AnyObject)
    {
        //Lorsque l'image est selectionné le segue s'active pour retourner vers la home
        self.performSegue(withIdentifier: "goHome", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Choix de la couleur 1
    @IBAction func Choice1(_ sender: Any) {
        //rgba(44, 62, 80,1.0)
        //modification de la transparence des bouton non selectionné
        choice1outlet.alpha = 1.0
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 0.5
        // création de la couleur associé au fond
        let color = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
    }

    @IBAction func Choice2(_ sender: Any) {
         //modification de la transparence des bouton non selectionné
        choice1outlet.alpha = 0.5
        choice2outlet.alpha = 1.0
        choice3outlet.alpha = 0.5
        // création de la couleur associé au fond
        let color = UIColor(red: 192.0/255.0, green: 57.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
        //rgba(192, 57, 43,1.0)
    }
    @IBAction func Choice3(_ sender: Any) {
        //rgba(241, 196, 15,1.0)
         //modification de la transparence des bouton non selectionné
        choice1outlet.alpha = 0.5
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 1.0
        // création de la couleur associé au fond
        let color = UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
    }
    
    // Appareil photo
    @IBAction func takePic(_ sender: Any) {
        //si le device possède un caméra disponible
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
                
                //confiucartion de l'image picker
                imagePicker.allowsEditing = false
                //source du device de type caméra
                imagePicker.sourceType = .camera
                imagePicker.cameraDevice = .front
                imagePicker.cameraCaptureMode = .photo
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("Rear camera indisponible")
            }
        } else {
            print("Camera inaccessible")
        }
    }
    
   //image depuis la library
    @IBAction func imgFromLib(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController() // Declare variable
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary // choix du type de souce que l'on veux 
            imagePicker.delegate = self // Evoi de l'info au controler disponible
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil) // affichage de acquisition interface
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // As? UIImage permet de vérifier le type renvoyé (image ou non)
            
            //Image taken temporarly as "UIImage"
            ImageChoice?.contentMode = .scaleAspectFit
            ImageChoice?.image = pickedImage
            
        }
        picker.dismiss(animated: true, completion: nil)
    }


   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
