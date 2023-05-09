//
//  Event.swift
//  CheatCodeCalendar
//
//  Created by Guest User on 5/5/23.
//

import Foundation

var eventsList = [Event]()

class Event: Codable  {
    var id: Int!
    var name: String!
    var date: Date!
    
   
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if(Calendar.current.isDate(event.date, inSameDayAs: date)) {
                daysEvents.append(event)
            }
        }
        
        return daysEvents
    }
    
}
