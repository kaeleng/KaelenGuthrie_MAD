//
//  scene2ViewController.swift
//  guthrie_midterm
//
//  Created by Kaelen Guthrie on 10/19/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class scene2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "saveInfo"{
            let scene1ViewController = segue.destination as! ViewController
            if userName.text!.isEmpty == false{
                scene1ViewController.user.name = userName.text
            }
            if userEmail.text!.isEmpty == false{
                scene1ViewController.user.email = userEmail.text
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.delegate = self
        userEmail.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
