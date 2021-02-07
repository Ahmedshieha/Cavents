//
//  EventCell.swift
//  Cavents
//
//  Created by Reda on 11/9/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var eventDateLable: UILabel!
    @IBOutlet weak var eventNameLable: UILabel!
    @IBOutlet weak var eventPlaceLAble: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customView.layer.cornerRadius = 10
        
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configureCell (event : Event) {

        eventDateLable.text! = event.eventDate!
        eventNameLable.text! = event.eventName!
        eventPlaceLAble.text! = event.eventPlace!
        
        
    }

    
}
