# AVMeetup

## How to run 

Add file - insert your api key here 

Meetup api key - should not be visible 


## Architecture 

MVC design pattern
tableview is not in a datasource 

Networking: Alamofire 
Data persistence (favorite events): nscoding, archiving and user defaults . EventsStore class to manage that saving it as a dictionary where key is event id and the value is the event object. 

EventsStore methods could be generic, but there isn't the complexity there not yet. 

As developers, it is our responsibility to understand the goals and needs of our applications, and to resist the urge to over-engineer and prematurely optimize our solutions.

The decision to use Core Data in an application may appear to be a no-brainer, if not harmless. But in many cases, Core Data is discovered to be so unwieldy or unnecessary as to become a real hindrance to making something useful, let alone functional.

And even if most applications would benefit from Core Data at some point, there is wisdom to letting complexity evolve from a simple as necessary. And as far as persistence goes, it doesn’t get much simpler than NSCoding.


As developers, it is our responsibility to understand the goals and needs of our applications, and to resist the urge to over-engineer and prematurely optimize our solutions. And even if most applications would benefit from Core Data at some point, there is wisdom to letting complexity evolve from a simple as necessary. And as far as persistence goes, it doesn’t get much simpler than NSCoding. [http://nshipster.com/nscoding/](http://nshipster.com/nscoding/)


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


## Acknowledgements & Resources

- Like icon credits - [icons8](https://icons8.com/web-app/87/Like)
- [NSCoding](http://nshipster.com/nscoding/)
- [UserDefaults and complex objects](https://www.codementor.io/brettr/tutorials/persisting-data-with-nsuserdefaults-and-complex-objects-du107m6ja)
- [UserDefaultsManager example](https://github.com/imk2o/UICatalog/blob/f040bd07a7de4a4b8df784c0c4444436b04ed813/UICatalog/Misc/UserDefaultsManager.swift)
- [Private IBOutlets](https://www.natashatherobot.com/swift-iboutlets-private/)
