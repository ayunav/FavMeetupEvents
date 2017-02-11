# Fav Meetup Events - Meetup Clone App

## Demo 

![Demo](https://github.com/ayunav/AVMeetup/blob/master/AVMeetupAppDemo.gif)


## How to run 

1. Download the source file 
2. Open AVMeetup.xcworkspace project 
3. You will see an error message and the missing `Constants.swift` file in the Project Navigator in the Constants folder.
4. Create new file (cmd + N), name it `Constants`, and add to the project.
5. Copy-paste the code below and insert your own [Meetup API key](http://www.meetup.com/meetup_api/key/):

````
import Foundation

let MeetupApiKey = "INSERT YOUR API KEY HERE"
````

Build and run 

## Architecture & Features 

### User Stories 

- A user should be able to see the list of upcoming iOS events in New York City. The networking request is hardcoded for now. 

- A user should be able to tap the heart button on any event to save it to favorites. 

- A user should be able to see their saved events by tapping Favorites segment of the UISegmentedControl on top of the table view. 

- A user should be able to unlike an event which will remove it from the Favorites. 

### Architecture 

- MVC
- Alamofire library to make networking requests code more succinct 
- `NSCoding/NSKeyedArchiver` to persist data for favorite events. `EventsStore` class manages saving favorite `Event` objects as a dictionary to `User Defaults`, where the key is an `eventID` `String`, and the value is an `Event` object. 

I was debating whether I should be adding complexity ("to reduce complexity", as Mike Walker said at the last [iOSoho meetup at Meetup](https://www.meetup.com/iOSoho/events/232889014/)) to this rather small app. If the app was larger, I would separate the `tableview`'s datasource into its own class, some methods could be generic like `EventsStore` class methods, and I would use `Core Data` to persist data across launches. However, I would agree with [Mattt Thompson](http://nshipster.com/authors/mattt-thompson/), [NSHipster](http://nshipster.com) contributor: "As developers, it is our responsibility to understand the goals and needs of our applications, and to resist the urge to over-engineer and prematurely optimize our solutions. There is wisdom to letting complexity evolve from as simple as necessary." - [source](http://nshipster.com/nscoding/)


## Acknowledgements & Resources

- Like icon credits - [icons8](https://icons8.com/web-app/87/Like)
- [Alamofire](https://github.com/Alamofire/Alamofire) networking library
- [NSHipster: NSCoding](http://nshipster.com/nscoding/)
- [UserDefaults and complex objects](https://www.codementor.io/brettr/tutorials/persisting-data-with-nsuserdefaults-and-complex-objects-du107m6ja)
- [UserDefaultsManager example](https://github.com/imk2o/UICatalog/blob/f040bd07a7de4a4b8df784c0c4444436b04ed813/UICatalog/Misc/UserDefaultsManager.swift)
- [Private IBOutlets](https://www.natashatherobot.com/swift-iboutlets-private/)


#### Screenshots 

<img src="https://github.com/ayunav/AVMeetup/blob/master/Screenshots/All_Events_Screenshot.png" width="45%" height="45%"> 
<img src="https://github.com/ayunav/AVMeetup/blob/master/Screenshots/Favorite_Events_Screenshot.png" width="45%" height="45%"> 


#### TO-DO: 

- add tests 
- create user facing alerts and handle error states
- add empty state UI for no favorite events state 
- add pull to refresh
- cache response result on networking request for open events 
- on an API request, check for connectivity 
- display user facing alert if offline

#### Next Steps: 

- add search bar to the navigation bar 
- add networking requests for search terms   
- add pagination 
- add location request and service 
