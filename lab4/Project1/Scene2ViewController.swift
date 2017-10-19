//
//  Scene2ViewController.swift
//  Project1
//
//  Created by Kaelen Guthrie on 10/5/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var userBand: UITextField!
    @IBOutlet weak var userVenue: UITextField!
    @IBOutlet weak var userStory: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "saveInfo"{
            let scene1ViewController = segue.destination as! ViewController
            if userBand.text!.isEmpty == false{
                scene1ViewController.user.concertBand = userBand.text
            }
            if userVenue.text!.isEmpty == false{
                scene1ViewController.user.concertVenue = userVenue.text
            }
            if userStory.text!.isEmpty == false{
                scene1ViewController.user.concertStory = userStory.text
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        userBand.delegate = self
        userVenue.delegate = self
        userStory.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
