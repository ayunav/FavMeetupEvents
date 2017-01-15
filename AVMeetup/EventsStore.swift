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
    private static let favoritedEventsIdsKey = "favoritedEventsIds"
    
    let userDefaults = UserDefaults.standard
    
    init() {
    
//        let favoritedEvents: [Event] = []
//        userDefaults.set(favoritedEvents, forKey: EventsStore.favoritedEventsKey)

        let favoritedEventsIds: [String] = []
        userDefaults.set(favoritedEventsIds, forKey: EventsStore.favoritedEventsIdsKey)
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
    
    // MARK: - fav events arr [Event]
    
    private func favEvents() -> [Event] {
        return userDefaults.array(forKey: EventsStore.favoritedEventsKey) as! [Event]
    }
    
    private func synchronizeFavEventsArray(updatedFavEvents: [Event]) {
        userDefaults.set(updatedFavEvents, forKey: EventsStore.favoritedEventsKey)
        userDefaults.synchronize()
    }

    
    // MARK: - fav events IDs [String]
    
    private func favEventsIds() -> [String] {
        return userDefaults.array(forKey: EventsStore.favoritedEventsIdsKey) as! [String]
    }
    
    private func synchronizeFavEventsIdsArray(updatedFavEventsIds: [String]) {
        userDefaults.set(updatedFavEventsIds, forKey: EventsStore.favoritedEventsIdsKey)
        userDefaults.synchronize()
    }

//    func checkIfEventsIsInArray(eventId: String) -> Bool {
//        if favEvents().contains( where: { $0.eventId == event.eventId }) {
//            removeFromFavEvents(event: event)
//        } else {
//            addEventToFavEventsArray(event: event)
//        }
//    }
    
    
    
//    func isLiked() -> Bool {
//        
//        
//    }

    func store(favState: Bool, for event: Event) {
        
        // get userDefaults favEventsArr
        // check if favEventsArr contains event with this eventId
        // remove or add depending on result ^^^
        
        if favEvents().contains( where: { $0.eventId == event.eventId }) {
            removeFromFavEvents(event: event)
        } else {
            addEventToFavEventsArray(event: event)
        }
        
        // get userDefaults favEventsArr
        // check is eventId is in the arr
        // if not, add to the arr,
        // if it is, remove from the arr
        // update favEventsArr
        // synchronize
        
//        let favEventsIds = self.favEventsIds()
//        
//        if isLiked {
//            
//        }
        
        
//        var favoritedEvents = UserDefaults.standard.array(forKey: "favoritedEvents")! // guard?
//        
//        if (isLiked) {
//            let isInArray = favoritedEvents.contains { $0 as! String == eventId }
//            // if it's not in the array, add eventId to the arr
//            if isInArray == false {
//                favoritedEvents.append(eventId)
//            }
//        } else {
//            // remove from array if it's there
//            let updatedFavEvents = favoritedEvents.filter( { $0 as! String != eventId })
//            favoritedEvents = updatedFavEvents
//            UserDefaults.standard.set(favoritedEvents, forKey:"favoritedEvents")
//        }
//        UserDefaults.standard.synchronize()
        
        
     
        
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
