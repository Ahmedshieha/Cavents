//
//  EventsViewController.swift
//  Cavents
//
//  Created by Reda on 11/9/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class EventsViewController: UIViewController {
    
    var eventsList = [Event]()
    
    @IBOutlet weak var eventCountLAable: UILabel!
    private var eventCollectionRefrence : CollectionReference!
    @IBOutlet weak var eventTableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCell()
        eventTableView.dataSource = self
        eventTableView.delegate = self
        refreshData()
        fetchData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        fetchData()
        refreshControl.endRefreshing()
    }
    
    @IBAction func likesButton(_ sender: Any) {
    }
    
    func refreshData() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        eventTableView.addSubview(refreshControl)
    }
    
    private func showCell () {
        let cellNib = UINib(nibName: "EventCell", bundle: nil)
        eventTableView.register(cellNib, forCellReuseIdentifier: "EventCell")
    }
    
    
    func fetchData () {
        let eventData = EventDataSource()
        
        eventData.getEvents { (events, error) in
            self.eventsList = events
            self.eventTableView.reloadData()
        }
    }
    
}
extension EventsViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil)
        let DetailsViewController = vc.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        self.present(DetailsViewController!, animated: true, completion: nil)
        DetailsViewController?.configureDetailsViewController(event: eventsList[indexPath.row])
    }
}


extension EventsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell" , for : indexPath ) as! EventCell
        cell.configureCell(event: eventsList[indexPath.row])
        return cell
    }
    
}


