//
//  Event.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

enum EventFields: String
{
    case eventId      = "id"
    case group        = "group"
    case groupUrlName = "urlname"
    case name         = "name"
    case rsvpCount    = "yes_rsvp_count"
    case time         = "time"
    case venue        = "venue"
}


class Event
{
    let date     : String
    let eventId  : String
    let group    : String
    let name     : String
    let rsvp     : String
    let time     : String
    let venue    : String
    
    init(date: String, eventId: String, group: String, name: String, rsvp: String, time: String, venue: String)
    {
        self.date      = date
        self.eventId   = eventId
        self.group     = group
        self.name      = name
        self.rsvp      = rsvp
        self.time      = time
        self.venue     = venue
    }
    
    
    private static let dateFormatter = DateFormatter()
    
    
    static func eventFromJsonDict(json: [String: AnyObject]) -> Event?
    {
        guard let time    = json[EventFields.time.rawValue]      as? Int,
            let rsvpCount = json[EventFields.rsvpCount.rawValue] as? Int,
            let name      = json[EventFields.name.rawValue]      as? String,
            let eventId   = json[EventFields.eventId.rawValue]   as? String,
            let groupName = json[EventFields.group.rawValue]?[EventFields.groupUrlName.rawValue] as? String,
            let venue     = json[EventFields.venue.rawValue]?[EventFields.name.rawValue]         as? String
            else { return nil }
        
        let (eventDate, eventTime) = dateFormatter.dateAndTimeFrom(time: time)
        
        let rsvp = "\(rsvpCount) people are going"
        
        return Event(date: eventDate, eventId: eventId, group: groupName, name: name, rsvp: rsvp, time: eventTime, venue: venue)
    }
    
}
