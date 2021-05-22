//
//  DataRequest.swift
//  Cavents
//
//  Created by Reda on 11/9/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class DataRequest {
    
    private var cityCollectionRef : CollectionReference!
    
   static func fetchData () {
        
        cityCollectionRef = Firestore.firestore().collection("events")
        cityCollectionRef.getDocuments {  (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else{
                
            }
        }
    }
}

