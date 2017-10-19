//
//  ViewController.swift
//  guthrie_midterm
//
//  Created by Kaelen Guthrie on 10/19/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var commuteMiles: UITextField!
    @IBOutlet weak var totalCommute: UILabel!
    @IBOutlet weak var totalGas: UILabel!
    @IBOutlet weak var currentGas: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var monthlyCommute: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user = Person()
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        nameLabel.text = user.name
        emailLabel.text = user.email
        
    }
    
    @IBAction func changeGas(_ sender: UISlider) {
        let gasAmount = sender.value
        currentGas.text=String(gasAmount)
    }
    
    @IBAction func changeToMonthly(_ sender: UISwitch) {
        if monthlyCommute.isOn{
            monthlyTotals()
        }
        else{
            updateTotals()
        }
    }
    
    @IBAction func changePicture(_ sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex == 0{
            imageView.image=UIImage(named: "car_icon.png")
        }
        if imageControl.selectedSegmentIndex == 1{
            imageView.image=UIImage(named: "bus_icon.png")
        }
        if imageControl.selectedSegmentIndex == 2{
            imageView.image=UIImage(named:"bike_icon.png")
            
        }
    }
    
    func monthlyTotals(){
        var commute:Float = 0.0
        var gasNeeded:Float = 0.0
        
        if commuteMiles.text!.isEmpty{
            commute = 0.0
        }
        else{
            commute = Float(commuteMiles.text!)!
        }
        
        var commuteTime : Float = 0.0
        
        
        commuteTime = 20 * ((Float(commute) / 20) * 60)
        gasNeeded = 20 * (commute / 24)
        let formatter = NumberFormatter()
        formatter.numberStyle=NumberFormatter.Style.decimal
        totalCommute.text = formatter.string(from: NSNumber(value: commuteTime))
        totalGas.text = formatter.string(from: NSNumber(value:gasNeeded))
    }
    
    func updateTotals(){
        var commute:Float
        var gasNeeded:Float = 0.0
        
        if commuteMiles.text!.isEmpty{
            commute = 0.0
        }
        else{
            commute = Float(commuteMiles.text!)!
        }
        
        var commuteTime : Float = 0.0
        commuteTime = (Float(commute) / 20) * 60
//       // print(commuteTime)
        gasNeeded = Float(commute) / 24
        let formatter = NumberFormatter()
        formatter.numberStyle=NumberFormatter.Style.decimal
        totalCommute.text = formatter.string(from: NSNumber(value: commuteTime))
        totalGas.text = formatter.string(from: NSNumber(value:gasNeeded))
        if commute > 50{
            let alert = UIAlertController(title: "Warning", message: "Your commute is long!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func calculateCommute(_ sender: Any) {
        if monthlyCommute.isOn{
            monthlyTotals()
        }
        else{
            updateTotals()
        }
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        commuteMiles.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

