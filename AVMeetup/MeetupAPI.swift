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
    
    
    
    
    
    let session: URLSession =
        {
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
                print("The events array is: " + eventsJson.description)

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
    
        
//        Alamofire.request(url).responseJSON(completionHandler: { response in
//            
//            print(response.request as Any)  // original URL request
//            print(response.response as Any) // HTTP URL response
//            print(response.data as Any)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//            
//            
////            let validResponse = response.result.value as! [String : AnyObject]
////            
////            let events = validResponse.flatMap(Event.eventFromJsonDict)
////            
////            if (events.count > 0) {
////                completion(EventsResult.success(events))
////            } else {
////                //                completion(EventsResult.Failure(nil))
////            }
//        })
//        
//    }
    
    

//    mutating func getEvents(completion: @escaping (EventsResult) -> Void)
//    {
//        let url = meetupRouter.openEventsURL()
//        
////        let url = "https://api.meetup.com/2/open_events?zip=11106&and_text=False&offset=0&format=json&limited_events=False&topic=ios&photo-host=public&page=1&radius=25.0&desc=False&status=upcoming&sig_id=136388792&sig=6990268dee14bb6fa628a6699ad47120aa1a8e34"
//
//        Alamofire.request(url).responseJSON(completionHandler: { response in
//            guard let results = response.result.value as? [[String: AnyObject]] else {
//                print(response.debugDescription)
//                print("\n \n \n \n FAILED \n \n \n \n")
//                return
//            }
//        
//            let events = results.flatMap(Event.eventFromJsonDict)
//            print(events)
//            
//            if events.count > 0 {
//                completion(EventsResult.success(events))
//            } else {
//                completion(EventsResult.failure(response.result.error!)) // fix later
//                debugPrint(response.result.error?.localizedDescription as Any)
//            }
//        })
//        
//        
////        Alamofire.request(url).responseJSON(completionHandler: { response in
////       
////            if let validResponse = response.result.value as? [[String: AnyObject]] {
////                
//////            guard let validResponse = response.result.value as? [[String: AnyObject]] else {
////                print(response.debugDescription)
//////                print("\n \n \n \n FAILED \n \n \n \n")
//////                return }
////            
////            let events = validResponse.flatMap(Event.eventFromJsonDict)
////            
////            if events.count > 0 {
////                completion(EventsResult.success(events))
////            } else {
////                completion(EventsResult.failure(response.result.error!)) // fix later
////                debugPrint(response.result.error?.localizedDescription as Any)
////            }
////            }})
//        
//            
//        
//    }

    
    
}
