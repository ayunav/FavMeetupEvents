//
//  EventsStore.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/14/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Foundation

protocol FavoriteEventsDelegate: class {
    func didUnlikeEvent()
}


class EventsStore: NSObject {
    
    static let shared = EventsStore()
    
    weak var delegate: FavoriteEventsDelegate?
    
    
    fileprivate var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    fileprivate override init() {
    }
    
    
    func set(value: Event, for key: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        self.userDefaults.set(data, forKey: key)
        self.userDefaults.synchronize()
    }
    
    
    func value(for key: String) -> Event? {
        let data = self.userDefaults.data(forKey: key)
        return data.flatMap {
            NSKeyedUnarchiver.unarchiveObject(with: $0) as? Event
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
    }

    
}
