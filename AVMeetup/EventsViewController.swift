//
//  EventsViewController.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/7/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteEventsDelegate {

    
    // MARK: - Properties 
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var eventsTableView: UITableView!

    private let CellIdentifier = "EventsTableViewCellIdentifier"
    
    var events: [Event] = []
    var meetupAPI = MeetupAPI()

    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EventsStore.shared.delegate = self 
        
        setupTableView()
        fetchEvents(sender: segmentedControl)
    }

    
    func setupTableView() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventsTableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier)
        
        eventsTableView.rowHeight = UITableViewAutomaticDimension
        eventsTableView.estimatedRowHeight = 140
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UISegmentedControl methods
    

    @IBAction func fetchEvents(sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            getEvents()
        case 1:
            displayFavoriteEvents()
      default:
            break;
        }
    }
    
    
    func getEvents() {
        
        meetupAPI.getEvents() { (eventsResult) -> Void in
            
            DispatchQueue.main.async {
                switch eventsResult {
                case let .success(_events):
                    self.events = _events
                    self.eventsTableView.reloadData()
                case let .failure(error):
                    print("Error fetching meetup events: \(error)")
                    // TODO: create user facing alert
                }
            }
        }
    }
    
    
    func displayFavoriteEvents() {
        
        self.events = EventsStore.shared.getFavoriteEvents()

        DispatchQueue.main.async {
            self.eventsTableView.reloadData()
        }
    }
    
    
    // MARK: - FavoriteEventsDelegate
    
    func didUnlikeEvent() {
        
        fetchEvents(sender: segmentedControl)
    }
    
    
    // MARK: - Table view data source
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! EventsTableViewCell
        
        cell.event = events[indexPath.row]
        
        cell.setup()

        return cell
    }
    
    
}
