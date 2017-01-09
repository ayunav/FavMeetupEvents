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
    
    
    // MARK: - URLSession
    /*
    let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
    }()

    
    mutating func getEvents(completion: @escaping (EventsResult) -> Void) {
        
        let url = meetupRouter.openEventsURL()
        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error)
                return completion(EventsResult.failure(error!))
            }

            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let eventsJson = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON")
                    return
                }
//                print("The events json array is: " + eventsJson.description)

                let events = eventsJson["results"] as! [[String : AnyObject]]
                
                var eventsToPass = [Event]()
                
                for event in events {
                    guard let ev = Event.eventFromJsonDict(json: event) else { continue }
                    eventsToPass.append(ev)
                }

                completion(EventsResult.success(eventsToPass))
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
    // MARK: - End of URLSession
    */
    
    // MARK: - Alamofire 
    
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
