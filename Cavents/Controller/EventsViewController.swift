//
//  EventsViewController.swift
//  Cavents
//
//  Created by Reda on 11/9/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class EventsViewController: UIViewController {
    
    let db = Firestore.firestore()
    var eventsList = [Event]()
    private var cityCollectionRef : CollectionReference!
    @IBOutlet weak var eventTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        showCell()
        eventTableView.dataSource = self
        eventTableView.delegate = self
        getData2()
    }
    
    
    @IBAction func likesButton(_ sender: Any) {
        
    }
    

    private func showCell () {

    let cellNib = UINib(nibName: "EventCell", bundle: nil)
        eventTableView.register(cellNib, forCellReuseIdentifier: "EventCell")
    }
    
    func getData2 () {
        
        
        cityCollectionRef = Firestore.firestore().collection("events")
        
        cityCollectionRef.getDocuments {  (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else{
                guard let snap = snapshot else{return}
                for document in snap.documents {
                    let data = document.data()
                    let name = data["name"] as? String
                    let date = data["date"] as? String
                    let place = data["place"] as? String 
                    
                    let newEvent = Event(eventName: name, eventPlace: place , eventDate : date)
                    self.eventsList.append(newEvent)
                }
                print("success for data ")
                self.eventTableView.reloadData()
            }
        }
      

    }
    
    
}

extension EventsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

}
extension EventsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell" , for : indexPath ) as! EventCell
        cell.configureCell(event: eventsList[indexPath.section])
//        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("cell")
        goToDetails()
    }

     
    
}

