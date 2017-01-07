//
//  EventsViewController.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/7/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var eventsTableView: UITableView!

    private let CellIdentifier = "EventsTableViewCellIdentifier"
    
    var events: [Event] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fetchEvents(sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            //getUpcomingEvents()
            print("all events selected")
        case 1:
//            getPastEvents()
            print("favorite events selected")
      default:
            break;
        }
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
        
        let event = events[indexPath.row]

//        cell.eventDateLabel.text = "JAN 07 07"
//        cell.groupNameLabel.text = "favorite events selected"
//        cell.eventTitleLabel.text = "favorite events selected"
//        cell.eventTimeLabel.text = "favorite events selected"
//        cell.venueLabel.text = "favorite events selected"
        
        cell.eventDateLabel.text = String(event.date)
        cell.groupNameLabel.text = event.group
        cell.eventTitleLabel.text = event.title
        cell.eventTimeLabel.text = String(event.date)
        cell.venueLabel.text = event.venue
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
