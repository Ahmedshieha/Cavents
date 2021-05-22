//
//  DetailsViewController.swift
//  Cavents
//
//  Created by Reda on 27/01/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift
class DetailsViewController: UIViewController {
    var myUrl  : String = ""
    let realm = try! Realm()
    
    @IBOutlet weak var eventPlaceLable: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var eventDateLable: UILabel!
    @IBOutlet weak var eventTimeLable: UILabel!
    @IBOutlet weak var eventDescriptionLable: UILabel!
    
    @IBAction func likeButton(_ sender: Any) {
        saveLikesEvent()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func saveLikesEvent () {
        let event = Event(eventName: eventNameLable.text ?? "", eventPlace: eventPlaceLable.text ?? "" , eventDate: eventDateLable.text ?? "", imageUrl:myUrl , eventDescription: eventDescriptionLable.text ?? "" , eventTime: eventTimeLable.text ?? "")
        try? realm.write{
            realm.add(event)
        }
    }
    
    @IBOutlet weak var eventNameLable: UILabel!
    
    func configureDetailsViewController (event : Event) {
        eventNameLable.text = event.eventName
        self.myUrl = event.imageUrl ?? ""
        let url = URL(string: myUrl)
        imageDetails.kf.setImage(with: url)
        eventPlaceLable.text = event.eventPlace
        eventDateLable.text = event.eventDate
        eventTimeLable.text = event.eventTime
        eventDescriptionLable.text = event.eventDescription
        
    }
    
    
    
}
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
