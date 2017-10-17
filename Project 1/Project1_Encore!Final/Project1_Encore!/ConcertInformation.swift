//
//  ConcertInformation.swift
//  Project1_Encore!
//
//  Created by Kaelen Guthrie on 10/14/17.
//  Copyright © 2017 Kaelen Guthrie. All rights reserved.
//

import UIKit

class ConcertInformation: NSObject {
    var name: String
    var image: String
    var path: URL
    var venue: String
    var story: String
    
    init(name: String, image: String, path: URL, venue: String, story: String){
        self.name = name
        self.image = image
        self.path = path
        self.venue = venue
        self.story = story
    }
}
