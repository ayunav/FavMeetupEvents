//
//  MeetupRouter.swift
//  AVMeetup
//
//  Created by Ayuna NYC on 1/6/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit


enum QueryItem: String
{
    case page = "10"
    case sign = "true"
//    case status = "upcoming"
//    case scroll = "recent_past"
}


struct MeetupRouter
{
    // MARK: - URL Components
    
    var urlComponents = URLComponents()
    
    init() {
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.meetup.com"
    }
    
    
    // MARK: - Events URL
    
    //  http://www.meetup.com/meetup_api/docs/2/open_events/)

    mutating func openEventsURL() -> URL {

        urlComponents.path = "/2/open_events"
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "key"  : MeetupApiKey,
            "sign" : QueryItem.sign.rawValue,
            "page" : QueryItem.page.rawValue, 
            "zip"  : "11106",
            "city" : "New York",
            "topic": "ios"
        ]
        
        for (key, value) in baseParams {
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
    
    
    
    private mutating func eventsURL(parameters: [String: String]?) -> URL {
        
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "key"  : MeetupApiKey,
            "sign" : QueryItem.sign.rawValue,
            "page" : QueryItem.page.rawValue
        ]
        
        for (key, value) in baseParams {
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        
        if let extraParams = parameters {
            for (key, value) in extraParams {
                let queryItem = URLQueryItem(name: key, value: value)
                queryItems.append(queryItem)
            }
        }
        
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
    
}
