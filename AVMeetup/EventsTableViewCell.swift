//
//  EventsTableViewCell.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
        
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var rsvpCountLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        likeButton.setImage(UIImage(named: "LikeButton"), for: .normal)
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        
        likeButton.setImage(UIImage(named: "LikeButtonActive"), for: .selected)
    }
    
    
}
