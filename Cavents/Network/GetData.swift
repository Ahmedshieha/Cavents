//
//  GetData.swift
//  Cavents
//
//  Created by Reda on 28/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EventDataSource {
    
    let dbRef = Firestore.firestore().collection("events")
    
    
    func getEvents(combletion : @escaping ([Event] , Error?) -> Void) {
        var events = [Event]()
        dbRef.getDocuments {snapshot , error in
            if let error = error {
                print(error)
                combletion(events , error)
                return
            }
            for document in snapshot!.documents {
                let data = document.data()
                let name = data["name"] as? String
                let date = data["date"] as? String
                let place = data["place"] as? String
                let image = data["image"] as? String
                let description = data["description"] as? String
                let time = data["time"] as? String
                let newEvent = Event(eventName: name, eventPlace: place , eventDate : date, imageUrl: image, description: description, eventTime: time)
                
                events.append(newEvent)
            }
            combletion(events,nil)
        }
        
    }
}





