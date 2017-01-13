//
//  BackgroundViewController.swift
//  TapMusics
//
//  Created by MENES SIMEU on 13/01/2017.
//  Copyright © 2017 MenesS. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 0.5
        
        imagePicker.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        ImageChoice?.isUserInteractionEnabled = true
        ImageChoice?.addGestureRecognizer(tapGestureRecognizer)

        // Do any additional setup after loading the view.
    }
    
    func imageTapped(img: AnyObject)
    {
        self.performSegue(withIdentifier: "goHome", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Choice1(_ sender: Any) {
        //rgba(44, 62, 80,1.0)
        choice1outlet.alpha = 1.0
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 0.5
        let color = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
    }

    @IBAction func Choice2(_ sender: Any) {
        choice1outlet.alpha = 0.5
        choice2outlet.alpha = 1.0
        choice3outlet.alpha = 0.5
        let color = UIColor(red: 192.0/255.0, green: 57.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
        //rgba(192, 57, 43,1.0)
    }
    @IBAction func Choice3(_ sender: Any) {
        //rgba(241, 196, 15,1.0)
        choice1outlet.alpha = 0.5
        choice2outlet.alpha = 0.5
        choice3outlet.alpha = 1.0
        let color = UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        ImageChoice?.backgroundColor = color
    }
    
    // ...
    @IBAction func takePic(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
                present(imagePicker, animated: true, completion: {})
            } else {
                print("Rear camera doesn't exist")
            }
        } else {
            print("Camera inaccessable")
        }
    }
   
    @IBAction func imgFromLib(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController() // Declare variable
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary // Since camera is available, affect value
            imagePicker.delegate = self // Send info to the current controller
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil) // We show image acquisition interface
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage { // As? UIImage permet de vérifier le type renvoyé (image ou non)
            //Image taken temporarly as "UIImage"
            ImageChoice?.contentMode = .scaleAspectFit
            ImageChoice?.image = pickedImage
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User canceled image")
        dismiss(animated: true, completion: {
            // Anything you want to happen when the user selects cancel
        })
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
