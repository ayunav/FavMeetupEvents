//
//  MeetupAPI.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Alamofire
import UIKit


enum EventsResult {
    case success([Event])
    case failure(Error)
}


struct MeetupAPI {
    
    var meetupRouter = MeetupRouter()
    
    
    mutating func getEvents(completion: @escaping (EventsResult) -> Void) {
        
        let url = meetupRouter.openEventsURL()
        
        Alamofire.request(url).responseJSON(completionHandler: { response in
            
            guard let results = response.result.value as? [String: AnyObject],
                  let eventsJson = results["results"] as? [[String: AnyObject]]
            else { return }
            
            let events = eventsJson.flatMap(Event.eventFromJsonDict)
            
            if events.count > 0 {
                completion(EventsResult.success(events))
            } else {
                completion(EventsResult.failure(response.result.error!)) // fix later
                debugPrint(response.result.error?.localizedDescription as Any)
            }
        })
    }

}
