//
//  ViewController.swift
//  lab3
//
//  Created by Kaelen Guthrie on 9/26/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var utilitiesAmount: UITextField!
    @IBOutlet weak var wifiAmount: UITextField!
    @IBOutlet weak var groceryAmount: UITextField!
    @IBOutlet weak var numberPeople: UITextField!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   

    func updateTotals(){
        var utilities:Float
        var wifi:Float
        var grocery:Float
        
        if utilitiesAmount.text!.isEmpty{
            utilities = 0.0
        }
        else{
            utilities = Float(utilitiesAmount.text!)!
            //print(utilities)
        }
        if wifiAmount.text!.isEmpty{
            wifi = 0.0
        }
        else{
            wifi = Float(wifiAmount.text!)!
            //print(wifi)
        }
        if groceryAmount.text!.isEmpty{
            grocery = 0.0
        }
        else{
            grocery = Float(groceryAmount.text!)!
            //print(grocery)
        }
        let numberOfPeople = Int(numberPeople.text!)
        //print(numberOfPeople)
        let total = utilities+wifi+grocery
        //print(total)
        var personTotal : Float = 0.0
        if numberOfPeople != nil{
            if numberOfPeople! > 0{
                personTotal = total / Float(numberOfPeople!)
            }
            else{
                let alert=UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in self.numberPeople.text="1"; self.updateTotals()})
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
        
        //print(personTotal)
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency
        totalDue.text=currencyFormatter.string(from: NSNumber(value: total))
        totalDuePerPerson.text=currencyFormatter.string(from: NSNumber(value: personTotal))
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTotals()
    }

    
    override func viewDidLoad() {
        utilitiesAmount.delegate = self
        wifiAmount.delegate = self
        groceryAmount.delegate = self
        numberPeople.delegate = self
        
        self.hideKeyboard()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController{
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        view.endEditing(true)
    }
}


