//
//  HomeVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit


class HomeVC : UIViewController{
    
    let eventypes = ["Featured Event", "Next Event", "Close To you "]
    var events : Event?
    @IBOutlet weak var homeTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllEvents()
    }
    
    
    
    func getAllEvents(){
        Networker.shared.get(url: URLConstants.event) { (result : Result<Event, APIError>) in
            switch result{
            case .success(let event):
                self.events = event
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
            case .failure(.badURL), .failure(.requestFailed), .failure(.jsonConversionFailure), .failure(.invalidData), .failure(.responseUnsuccessful):
                self.showAlert(withTitle: "Error", withMessage: "The request couldnt be processed")
            }
        }
        
    }
}


extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HometableCell", for: indexPath) as! HomeTableViewCell
        cell.eventType.text = eventypes[indexPath.row]
        cell.event = events
        cell.vc = self
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
}


