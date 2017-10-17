//
//  viewConcertViewController.swift
//  Project1_Encore!
//
//  Created by Kaelen Guthrie on 10/16/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class viewConcertViewController: UIViewController {
    
    var concert = Concert()
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var storyTextView: UITextView!
    var newImage: UIImage?

    override func viewWillAppear(_ animated: Bool) {
        bandLabel.text = concert.bandName!
        imageView.image = newImage
        venueLabel.text = concert.venueName!
        storyTextView.text = concert.concertStory!
    }
    override func viewDidLoad() {
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
