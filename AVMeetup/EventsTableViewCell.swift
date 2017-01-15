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
    
    @IBOutlet weak var eventDateLabel: UILabel! // how to make private?
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var rsvpCountLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeButton.setImage(UIImage(named: "LikeButton"), for: .normal)
        likeButton.setImage(UIImage(named: "LikeButtonActive"), for: .selected)
    }

    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("LIKED")
        
        sender.isSelected = !sender.isSelected
        event.isLiked = sender.isSelected

        // set event property for isLiked
        // persist isLiked value
    
        
//        likeButton.setTitle(likes[indexPath.row], forState: UIControlState.Normal)
    }
    
    
    func setup () {
        
        eventDateLabel.text  = event.date
        eventTitleLabel.text = event.name
        eventTimeLabel.text  = event.time
        groupNameLabel.text  = event.group
        venueLabel.text      = event.venue
        rsvpCountLabel.text  = event.rsvp
        
        likeButton.isSelected = event.isLiked
    }
    
    
//    func toggleLikeState(sender: UIButton){
//
//        println(sender.tag) // This works, every cell returns a different number and in order.
//        if likes[sender.tag] == "like" {
//            likes[sender.tag] = "unlike"
//        }
//        else {
//            likes[sender.tag] = "like"
//        }
//        sender.setTitle(likes[sender.tag], forState: UIControlState.Normal)
//    }
    
}
