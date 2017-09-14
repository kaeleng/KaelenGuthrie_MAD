//
//  ViewController.swift
//  Lab1
//
//  Created by Kaelen Guthrie on 9/11/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func chooseImage(_ sender: UIButton) {
        if sender.tag == 1{
            picture.image = UIImage(named: "budapest")
            labelText.text = "I traveled around Budapest"
        }
        if sender.tag == 2{
            picture.image = UIImage(named: "krn")
            labelText.text = "I also traveled to Slovenia"
        }
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

