//
//  HomeViewController.swift
//  TapMusics
//
//  Created by MENES SIMEU on 12/01/2017.
//  Copyright © 2017 MenesS. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource,CLLocationManagerDelegate{
    
    
    //API Météo
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "a16d5a35a649b064ce60f14256407e15"
    
    
    @IBOutlet weak var tableView: UITableView!
    var soundStyle = ["Techno","Hip-Hop","Trance","Indus"]
    //BG
    @IBOutlet weak var background: UIImageView!
    var color : UIColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    
    
    
    
    //Son techno
    var soundTechno1: [String] = ["beat21","beat22","beat23","beat24","beat25"]
    var soundTechno2: [String] = ["effect21","effect22","effect23","effect24","effect25"]
    var soundTechno3: [String] = ["melo21","melo22","melo23","melo24","melo25"]
    var soundTechno4: [String] = ["voix21","voix22","voix23","voix24","voix25"]
    

    
    //LOCATION
    let locationManager = CLLocationManager()
    let currentlocation = CLLocation()
    
    //Coor
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    var lat : String = ""
    var long : String = ""
    //VILLE
    @IBOutlet weak var cityLabel: UILabel!
    var addresse: String = ""
    //TIME
    @IBOutlet weak var timeLabel: UILabel!
    
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        background.backgroundColor = color
        
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);

        
        //Location 

        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func update() {
        timeLabel.text = currentTime()
        background.backgroundColor = self.color
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.soundStyle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.soundStyle[indexPath.row]
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "oneSegue", sender: cell?.textLabel?.text)
    }
    

    
    
    func currentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let sec = calendar.component(.second, from: date)
        return "\(hour):\(minutes):\(sec)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var currentLocation = locations[0]
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            currentLocation = locationManager.location!
            lat = currentLocation.coordinate.latitude.description
            long = currentLocation.coordinate.longitude.description
            
            latitude.text = String(lat.characters.prefix(4))
            longitude.text = String(long.characters.prefix(4))
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(currentLocation, completionHandler: { (placemarks, error) -> Void in
                
                    // Place details
                    var placeMark: CLPlacemark!
                    placeMark = placemarks?[0]
                    
                    // Address dictionary
                    //print(placeMark.addressDictionary as Any, terminator: "")
                    
                    if let city = placeMark.addressDictionary!["City"] as? NSString {
                        //print(city, terminator: "")
                        self.addresse = city as String
                        
                    }
                    
                    // Country
                    if let country = placeMark.addressDictionary!["Country"] as? NSString {
                        //print(country, terminator: "")
                        self.addresse += ", "
                        self.addresse += country as String
                    }
                    self.cityLabel.text = self.addresse
                    
                    //print(self.addresse)
                if error != nil {
                    self.locationManager.stopUpdatingLocation()
                }

                
            })
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "oneSegue" && sender != nil){
            let DestViewController : ViewController = segue.destination as! ViewController
            DestViewController.titre = (sender as? String)!
            if ((sender as? String) == "Hip-hop"){
                
            }
            if ((sender as? String) == "Techno"){
                
                //transfere de son
                DestViewController.sound1 = soundTechno1
                DestViewController.sound2 = soundTechno2
                DestViewController.sound3 = soundTechno3
                DestViewController.sound4 = soundTechno4
                
            }
            if ((sender as? String) == "Trance"){}
            if ((sender as? String) == "Indus"){}
            
            
            
        }
        
    }
    
   
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
        print (segue.source)
        let SrcViewController : BackgroundViewController = segue.source as! BackgroundViewController
        if (SrcViewController.ImageChoice?.image != nil ){
            self.background.image = SrcViewController.ImageChoice?.image
        
        }else{
            self.background.image = nil
        
            self.color = (SrcViewController.ImageChoice?.backgroundColor)!
            
        }
        // print("Menes Menes Menes")
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
