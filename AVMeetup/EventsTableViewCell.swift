//
//  EventsTableViewCell.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    /*
     The event name
     The Meetup Group name
     The event date and time
     How many people have RSVP’d yes so far
     */
    
    // eventNameLabel
    // groupNameLabel
    // eventDateAndTimeLabel
    // rsvpCountLabel 
    // favoriteStateButton
    
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var rsvpCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
