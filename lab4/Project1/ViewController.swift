//
//  ViewController.swift
//  Project1
//
//  Created by Kaelen Guthrie on 10/5/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    
    let filename = "shows.plist"
    
    func docFilePath(_ filename: String) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString
        return dir.appendingPathComponent(filename)
    }
    
    var user = Concert()
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        bandLabel.text = user.concertBand
        venueLabel.text = user.concertVenue
        storyLabel.text = user.concertStory
    }

    override func viewDidLoad() {
        let filePath = docFilePath(filename)
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            if dataDictionary.keys.contains("band"){
                user.concertBand = dataDictionary["band"]
                bandLabel.text = user.concertBand
            }
            if dataDictionary.keys.contains("venue"){
                user.concertVenue = dataDictionary["venue"]
                venueLabel.text = user.concertVenue
            }
            if dataDictionary.keys.contains("story"){
                user.concertStory = dataDictionary["story"]
                storyLabel.text = user.concertStory
            }
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
    }
    

    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        if user.concertBand != nil{
            data.setValue(user.concertBand, forKey: "band")
        }
        if user.concertVenue != nil{
            data.setValue(user.concertVenue, forKey: "venue")
        }
        if user.concertStory != nil{
            data.setValue(user.concertStory, forKey: "story")
        }
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

