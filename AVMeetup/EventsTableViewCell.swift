//
//  EventsTableViewCell.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    var event: Event!
    
    @IBOutlet weak private var venueLabel: UILabel!
    @IBOutlet weak private var eventDateLabel: UILabel! 
    @IBOutlet weak private var groupNameLabel: UILabel!
    @IBOutlet weak private var eventTimeLabel: UILabel!
    @IBOutlet weak private var rsvpCountLabel: UILabel!
    @IBOutlet weak private var eventTitleLabel: UILabel!
    
    @IBOutlet weak private var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeButton.setImage(UIImage(named: "LikeButton"), for: .normal)
        likeButton.setImage(UIImage(named: "LikeButtonActive"), for: .selected)
    }

    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        event.isLiked = sender.isSelected
    }
    
    
    func setup () {
        
        venueLabel.text       = event.venue
        eventDateLabel.text   = event.date
        eventTimeLabel.text   = event.time
        groupNameLabel.text   = event.group
        rsvpCountLabel.text   = event.rsvp
        eventTitleLabel.text  = event.name
        
        likeButton.isSelected = event.isLiked
    }
 
}
