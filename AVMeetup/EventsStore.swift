//
//  EventsStore.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/14/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Foundation

class EventsStore: NSObject {
    
    // Private properties 
    
    private static let favEventsKey = "favoriteEvents"
    
//    private var userDefaults: UserDefaults!
    
    //    override init() {
    //        userDefaults = UserDefaults.standard
    //    }
    
    
    // Public properties 
    
    static let sharedInstance = EventsStore()
    
    static var favoriteEvents = [Event]()

    
    fileprivate var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    fileprivate override init() {
    }
    
    
    func set<V>(value: V, for key: String) where V: NSCoding {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        self.userDefaults.set(data, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func value<V>(for key: String) -> V? where V: NSCoding {
        let data = self.userDefaults.data(forKey: key)
        return data.flatMap {
            NSKeyedUnarchiver.unarchiveObject(with: $0) as? V
        }
    }
    
    func contains(for key: String) -> Bool {
        return self.userDefaults.object(forKey: key) != nil
    }
    
    func remove(for key: String) {
        self.userDefaults.removeObject(forKey: key)
    }
    
    
    
    func getFavoriteEvents() -> [Event] {
        
        var favEvents = [Event]()

        for key in self.userDefaults.dictionaryRepresentation().keys {
            if let event: Event = self.value(for: key) {
                favEvents.append(event)
            }
        }
        
        return favEvents
        
//        if let data = userDefaults.object(forKey: EventsStore.favEventsKey) as? Data {
//            EventsStore.favoriteEvents = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Event]
//        }
//        return EventsStore.favoriteEvents
    }
    
    
    
    func likedStateForEvent(with id: String) -> Bool {
        
        let events = EventsStore.sharedInstance.getFavoriteEvents()
        
        let event = events.first { $0.eventId == id }
        
        if event != nil {
            return true
        } else {
            return false
        }
    }
    
    
    
    func updateStoredEvents(with event: Event) {
        
        // unarchive the arr 
        
        EventsStore.favoriteEvents = getFavoriteEvents()
        
        // 2. If event is in the arr, remove it from the arr; else add to the array
        
        if (EventsStore.favoriteEvents.contains { $0.eventId == event.eventId} == true) {

            EventsStore.favoriteEvents = EventsStore.favoriteEvents.filter { $0.eventId != event.eventId }
        
        } else {
        
            EventsStore.favoriteEvents.append(event)
        }
        
        let data = NSKeyedArchiver.archivedData(withRootObject: EventsStore.favoriteEvents)
        UserDefaults.standard.set(data, forKey: EventsStore.favEventsKey)
        UserDefaults.standard.synchronize()
    }
    
    
    

    
    
    
    
    // MARK: - Old
    
    
    
//    let userDefaults = UserDefaults.standard
//    
//    init() {
//    
//        let favoritedEvents: [Event] = []
//        userDefaults.set(favoritedEvents, forKey: EventsStore.favoritedEventsKey)
//
//        userDefaults.synchronize()
//    }
//    
    
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
    
//    private func favEvents() -> [Event] {
//        return userDefaults.array(forKey: EventsStore.favoritedEventsKey) as! [Event]
//    }
//    
//    private func synchronizeFavEventsArray(updatedFavEvents: [Event]) {
//        userDefaults.set(updatedFavEvents, forKey: EventsStore.favoritedEventsKey)
//        userDefaults.synchronize()
//    }
//
//    
//    // MARK: - fav events IDs [String]
//    
//    private func favEventsIds() -> [String] {
//        return userDefaults.array(forKey: EventsStore.favoritedEventsIdsKey) as! [String]
//    }
//    
//    private func synchronizeFavEventsIdsArray(updatedFavEventsIds: [String]) {
//        userDefaults.set(updatedFavEventsIds, forKey: EventsStore.favoritedEventsIdsKey)
//        userDefaults.synchronize()
//    }
//
////    func checkIfEventsIsInArray(eventId: String) -> Bool {
////        if favEvents().contains( where: { $0.eventId == event.eventId }) {
////            removeFromFavEvents(event: event)
////        } else {
////            addEventToFavEventsArray(event: event)
////        }
////    }
//    
//    
//    
////    func isLiked() -> Bool {
////        
////        
////    }
//
//    func store(favState: Bool, for event: Event) {
//        
//        // get userDefaults favEventsArr
//        // check if favEventsArr contains event with this eventId
//        // remove or add depending on result ^^^
//        
//        if favEvents().contains( where: { $0.eventId == event.eventId }) {
//            removeFromFavEvents(event: event)
//        } else {
//            addEventToFavEventsArray(event: event)
//        }
//        
//        // get userDefaults favEventsArr
//        // check is eventId is in the arr
//        // if not, add to the arr,
//        // if it is, remove from the arr
//        // update favEventsArr
//        // synchronize
//        
////        let favEventsIds = self.favEventsIds()
////        
////        if isLiked {
////            
////        }
//        
//        
////        var favoritedEvents = UserDefaults.standard.array(forKey: "favoritedEvents")! // guard?
////        
////        if (isLiked) {
////            let isInArray = favoritedEvents.contains { $0 as! String == eventId }
////            // if it's not in the array, add eventId to the arr
////            if isInArray == false {
////                favoritedEvents.append(eventId)
////            }
////        } else {
////            // remove from array if it's there
////            let updatedFavEvents = favoritedEvents.filter( { $0 as! String != eventId })
////            favoritedEvents = updatedFavEvents
////            UserDefaults.standard.set(favoritedEvents, forKey:"favoritedEvents")
////        }
////        UserDefaults.standard.synchronize()
//        
//        
//     
//        
//    }
//    
//    
//    func storeFavStateForThe(event: Event) {
//        // get userDefaults favEventsArr
//        // check if favEventsArr contains event with this eventId 
//        // remove or add depending on result ^^^
//        
//        if favEvents().contains( where: { $0.eventId == event.eventId }) {
//            removeFromFavEvents(event: event)
//        } else {
//            addEventToFavEventsArray(event: event)
//        }
//
//    }
//    
//    
//    private func removeFromFavEvents(event: Event) {
//        let updatedFavEvents = favEvents().filter({ $0.eventId != event.eventId }) // returns an arr w/out the event with eventId
//        synchronizeFavEventsArray(updatedFavEvents: updatedFavEvents)
//    }
//    
//    
//    private func addEventToFavEventsArray(event: Event) {
//        // get userDefaults favEventsArr
//        // add event to the arr 
//        // synchronize
//        
//        var updatedFavEvents = favEvents()
//        updatedFavEvents.append(event)
//        synchronizeFavEventsArray(updatedFavEvents: updatedFavEvents)
//    }


}
