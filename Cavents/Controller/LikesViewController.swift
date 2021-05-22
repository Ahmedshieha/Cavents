//
//  LikesViewController.swift
//  Cavents
//
//  Created by Reda on 07/01/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import RealmSwift
class LikesViewController: UIViewController {
    
    var likeEventList = [Event]()
    @IBOutlet weak var likesTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        showCell()
        likesTableView.delegate = self
        likesTableView.dataSource = self
        retrieveEvent()
        
    }
        func retrieveEvent(){
            let realm = try! Realm()
            let likesEvents = realm.objects(Event.self).toArray(ofType: Event.self) as [Event]
            for event in likesEvents {
                likeEventList.append(event)
            }
            
        }
    
    
    
    private func showCell () {
        let cellNib = UINib(nibName: "EventCell", bundle: nil)
        likesTableView.register(cellNib, forCellReuseIdentifier: "EventCell")
    }
    
}

extension LikesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
extension LikesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeEventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        cell.configureCell(event: likeEventList[indexPath.row])
        return cell
    }
    
    
}
