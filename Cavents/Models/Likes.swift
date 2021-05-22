//
//  Likes.swift
//  Cavents
//
//  Created by Reda on 03/03/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
import  RealmSwift


class Events: Object {
    
    @objc dynamic var eventName: String?
    @objc dynamic var eventPlace: String?
    @objc dynamic var imageUrl: String?
    @objc dynamic var eventDescription: String?
    @objc dynamic var eventTime: String?
    
    convenience init (eventName : String , eventPlace : String , imageUrl : String , eventDescription : String , eventTime : String) {
        self.init()
        
        self.eventName = eventName
        self.eventPlace = eventPlace
        self.imageUrl = imageUrl
        self.eventDescription = eventDescription
        self.eventTime = eventTime
    }
    
}
