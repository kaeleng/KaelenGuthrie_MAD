//
//  ViewController.swift
//  lab2
//
//  Created by Kaelen Guthrie on 9/17/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var colorSwitch: UISwitch!
    
    
    func updateImage(){
        if imageControl.selectedSegmentIndex==0{
            titleLabel.text="Coffee"
            drinkImage.image=UIImage(named: "coffee.png")
        }
        else if imageControl.selectedSegmentIndex==1{
            titleLabel.text="Tea"
            drinkImage.image=UIImage(named: "tea.png")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn{
            titleLabel.text=titleLabel.text?.uppercased()
           // titleLabel.textColor=UIColor.purple
        }
        else{
            titleLabel.text=titleLabel.text?.lowercased()
          //  titleLabel.textColor=UIColor.cyan
        }
    }


    @IBAction func updateColor(_ sender: UISwitch) {
        //updateColor()
        if colorSwitch.isOn{
            self.titleLabel.textColor=UIColor.purple
        }
        else{
            self.titleLabel.textColor=UIColor.cyan
        }
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize:fontSizeCGFloat)
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
        
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

