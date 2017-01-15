//
//  EventsStore.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/14/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Foundation

class EventsStore {
    
    static let sharedInstance = EventsStore()
    
    private static let favoritedEventsKey = "favoritedEvents"
    
    let userDefaults = UserDefaults.standard
    
    init() {
    
        let favoritedEvents: [Event] = []
        userDefaults.set(favoritedEvents, forKey: EventsStore.favoritedEventsKey)
        userDefaults.synchronize()
    }
    
    
    /*
    if event.isLiked == true {
        if the event is in the favEventsArray == true {
            remove the event from favEventsArr
            synchronize
        } else {
            add event to favEventsArr 
            synchronize
        }
     }
     
    
    */
    
    private func favEvents() -> [Event] {
        return userDefaults.array(forKey: EventsStore.favoritedEventsKey) as! [Event]
    }
    
    
    private func synchronizeFavEventsArray(updatedFavEvents: [Event]) {
        userDefaults.set(updatedFavEvents, forKey: EventsStore.favoritedEventsKey)
        userDefaults.synchronize()
    }
    
    
    func storeFavStateForThe(event: Event) {
        // get userDefaults favEventsArr
        // check if favEventsArr contains event with this eventId 
        // remove or add depending on result ^^^
        
        if favEvents().contains( where: { $0.eventId == event.eventId }) {
            removeFromFavEvents(event: event)
        } else {
            addEventToFavEventsArray(event: event)
        }

    }
    
    
    private func removeFromFavEvents(event: Event) {
        let updatedFavEvents = favEvents().filter({ $0.eventId != event.eventId }) // returns an arr w/out the event with eventId
        synchronizeFavEventsArray(updatedFavEvents: updatedFavEvents)
    }
    
    
    private func addEventToFavEventsArray(event: Event) {
        // get userDefaults favEventsArr
        // add event to the arr 
        // synchronize
        
        var updatedFavEvents = favEvents()
        updatedFavEvents.append(event)
        synchronizeFavEventsArray(updatedFavEvents: updatedFavEvents)
    }


}
