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
    
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel! // how to make private?
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var rsvpCountLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    
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
