//
//  Event.swift
//  CheatCodeCalendar
//
//  Created by Guest User on 5/5/23.
//

import Foundation

var eventsList = [Event]()
var daysEvents = [Event]()
class Event  {
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        
        //var daysEvents = UserDefaults.standard.array(forKey: "Events")
        for event in eventsList {
            if(Calendar.current.isDate(event.date, inSameDayAs: date)) {
                daysEvents.append(event)
                userDefaults.set(daysEvents, forKey: "Event")
            }
        }
        return daysEvents
    }
}
