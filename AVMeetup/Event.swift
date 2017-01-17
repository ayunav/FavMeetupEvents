//
//  Event.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit


enum EventFields: String {

    case eventId      = "id"
    case group        = "group"
    case groupUrlName = "urlname"
    case name         = "name"
    case rsvpCount    = "yes_rsvp_count"
    case time         = "time"
    case venue        = "venue"
}


class Event: NSObject, NSCoding {
    
    let date     : String
    let eventId  : String
    let group    : String
    let name     : String
    let rsvp     : String
    let time     : String
    let venue    : String
    
    var isLiked  : Bool = false {
        didSet {
            if (isLiked) {
                if (EventsStore.shared.contains(for: self.eventId) == true) {
                    EventsStore.shared.remove(for: self.eventId)
                } else {
                    EventsStore.shared.set(value: self, for: self.eventId)
                }
            } else {
                EventsStore.shared.remove(for: self.eventId)
                EventsStore.shared.delegate?.didUnlikeEvent()
            }
        }
    }
    
    
    init(date: String, eventId: String, group: String, name: String, rsvp: String, time: String, venue: String) {
        
        self.date    = date
        self.eventId = eventId
        self.group   = group
        self.name    = name
        self.rsvp    = rsvp
        self.time    = time
        self.venue   = venue
        
        self.isLiked = EventsStore.shared.contains(for: self.eventId)
    }
    

    // MARK: - Public API
    
    
    private static let dateFormatter = DateFormatter()
    
    
    static func eventFromJsonDict(json: [String: AnyObject]) -> Event? {
        
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
    
    
    // MARK: - NSCoding
    

    required convenience init?(coder aDecoder: NSCoder) {

        guard let date  = aDecoder.decodeObject(forKey: "date")    as? String,
            let name    = aDecoder.decodeObject(forKey: "name")    as? String,
            let rsvp    = aDecoder.decodeObject(forKey: "rsvp")    as? String,
            let time    = aDecoder.decodeObject(forKey: "time")    as? String,
            let venue   = aDecoder.decodeObject(forKey: "venue")   as? String,
            let group   = aDecoder.decodeObject(forKey: "group")   as? String,
            let eventId = aDecoder.decodeObject(forKey: "eventId") as? String
            else { return nil }

        
        self.init(
            date   : date,
            eventId: eventId,
            group  : group,
            name   : name,
            rsvp   : rsvp,
            time   : time,
            venue  : venue
        )
        
        self.isLiked = aDecoder.decodeBool(forKey: "isLiked")
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.date,    forKey: "date")
        aCoder.encode(self.name,    forKey: "name")
        aCoder.encode(self.rsvp,    forKey: "rsvp")
        aCoder.encode(self.time,    forKey: "time")
        aCoder.encode(self.group,   forKey: "group")
        aCoder.encode(self.venue,   forKey: "venue")
        aCoder.encode(self.eventId, forKey: "eventId")
        aCoder.encode(self.isLiked, forKey: "isLiked")
    }

    
}
