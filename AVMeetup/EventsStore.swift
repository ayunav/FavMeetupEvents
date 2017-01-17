//
//  EventsStore.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/14/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Foundation

class EventsStore: NSObject {

    
    static let shared = EventsStore()
    
    
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
    }

    
}
