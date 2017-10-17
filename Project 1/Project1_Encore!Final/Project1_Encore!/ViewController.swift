//
//  ViewController.swift
//  Project1_Encore!
//
//  Created by Kaelen Guthrie on 10/14/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//
//  Sources:
//  www.hackingwithswift.com/read/10/6/connecting-up-the-people
//  https://spin.atomicobject.com/2014/10/25/ios-unwind-segues/
//  https://stackoverflow.com/questions/33058691/use-uiimagepickercontroller-in-landscape-mode-in-swift-2-0
//  https://wtop.com/wp-content/uploads/2017/05/ThinkstockPhotos-526833490.jpg

import UIKit

class ViewController: UICollectionViewController {
    
    let filename = "favs.plist"
    var concert = Concert()
    var concertInfo = [ConcertInformation]()
    var nameOfBand: String?
    var imageOfConcert: UIImage?
    var nameOfVenue: String?
    var storyAboutConcert: String?
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
       
//        print(concert.imageName)
//        print(concert.bandName)
//        let newName = concert.bandName
        let information = ConcertInformation(name: concert.bandName!, image: concert.imageName!, path: concert.imagePath!, venue: concert.venueName!, story: concert.concertStory!)
        concertInfo.append(information)
//        print(concertInfo[0].path)
//        print(concertInfo[0].name)
//        print(concertInfo.count)
        self.collectionView?.reloadData()
    }
    
    @IBAction func unwindFromViewConcert(_ segue:UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewConcert"{
            let scene3ViewController = segue.destination as! viewConcertViewController
            //let information = concertInfo[indexPath.row]
            scene3ViewController.concert.bandName = nameOfBand!
            scene3ViewController.concert.venueName = nameOfVenue!
            scene3ViewController.concert.concertStory = storyAboutConcert!
      //      print(concert.bandName)
            scene3ViewController.newImage = imageOfConcert
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("created new cell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConcertInformation", for: indexPath) as! ConcertCell
        
        let information = concertInfo[indexPath.row]
        cell.name.text = information.name
        nameOfBand = information.name
//        print(nameOfBand)
        nameOfVenue = information.venue
//        print(nameOfVenue)
        storyAboutConcert = information.story
//        print(storyAboutConcert)
        let path = getDocumentsDirectory().appendingPathComponent(information.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        imageOfConcert = cell.imageView.image
        
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return concertInfo.count
    }
    
    func docFilePath(_ filename: String) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to out data file
        //print(dir.appendingPathComponent(filename))
        return dir.appendingPathComponent(filename)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let filePath = docFilePath(filename)
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            if dataDictionary.keys.contains("bands"){
                concert.bandName = dataDictionary["bands"]
            }
        }
        
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
    }
    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        if concert.bandName != nil{
            data.setValue(concert.bandName, forKey: "bands")
        }
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

