//
//  addConcertViewController.swift
//  Project1_Encore!
//
//  Created by Kaelen Guthrie on 10/14/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit
import MobileCoreServices

class addConcertViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userConcert: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userVenue: UITextField!
    @IBOutlet weak var userStory: UITextView!
    var concertImagePath: URL?
    var concertImageName: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "saveConcert"{
            let scene1ViewController = segue.destination as! ViewController
            if userConcert.text!.isEmpty == false{
                scene1ViewController.concert.bandName = userConcert.text!
            }
            if userVenue.text!.isEmpty == false{
                scene1ViewController.concert.venueName = userVenue.text!
            }
            if userStory.text!.isEmpty == false{
                scene1ViewController.concert.concertStory = userStory.text!
            }
         //  scene1ViewController.concert.imageName = getDocumentsDirectory().imagePath.imageName
            scene1ViewController.concert.imagePath = concertImagePath
            scene1ViewController.concert.imageName = concertImageName
        }
      
    }
    
    @IBAction func choosePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
     
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = UIImageJPEGRepresentation(image, 80) {
            try? jpegData.write(to: imagePath)
        }
//        print(contentsOfFile: imagePath)
//        print("image",image)
//        print(imageName)
        concertImagePath = imagePath
        concertImageName = imageName
//        print(jpegData)
        imageView.image = image
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        imageView.image = UIImage(imageName)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        userVenue.delegate=self
        userConcert.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
