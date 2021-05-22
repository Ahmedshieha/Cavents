//
//  EventCell.swift
//  Cavents
//
//  Created by Reda on 11/9/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift
class EventCell: UITableViewCell {
    
    var myUrl : String = ""
    let realm = try! Realm()
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var eventDateLable: UILabel!
    @IBOutlet weak var eventNameLable: UILabel!
    @IBOutlet weak var eventPlaceLAble: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    var addActionHandler: (() -> Void)?
    
    @IBAction func heartButton(_ sender: Any) {
        
        if heartButton.image(for: .normal) == UIImage(named: "white heart") {
            heartButton.setImage(UIImage(named: "red heart"), for: .normal)
            saveLikesEvent()
            
        }
        else {
            heartButton.setImage(UIImage(named: "white heart"), for: .normal)
      
        }
        
        self.addActionHandler?()
        
        
    }
    
    func saveLikesEvent() {
        let event = Event(eventName: eventNameLable.text ?? "", eventPlace: eventPlaceLAble.text ?? "" , eventDate: eventDateLable.text ?? "", imageUrl: myUrl, eventDescription: "", eventTime: "")
        
        try? realm.write{
            realm.add(event)
        }
    }
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
        customView.layer.cornerRadius = 10
        
        heartButton.setImage(UIImage(named: "white heart"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    func configureCell (event : Event) {
        
        eventDateLable.text! = event.eventDate!
        eventNameLable.text! = event.eventName!
        eventPlaceLAble.text! = event.eventPlace!
        self.myUrl = event.imageUrl ?? ""
        let url = URL(string: myUrl)
        imageEvent.kf.setImage(with: url)
    }
  
}
