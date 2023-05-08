//
//  CalendarViewController.swift
//  CheatCodeCalendar
//
//  Created by Guest User on 4/27/23.
//

import UIKit
import EventKit

var selectedDate = Date()

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var date = Date()
    
    var totalSquares = [Date]()
    
    let df = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.isAccessibilityElement = true
        setCellsView()
        setWeekView()
      
        // Do any additional setup after loading the view.
        daysEvents = userDefaults.array(forKey: "Event") as? [Event] ?? [Event]()
    }
    
    func setCellsView() {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        cell.isUserInteractionEnabled = true
        let date = totalSquares[indexPath.item]
        
        cell.dayOfMonth.text = String(CalendarHelper().daysOfMonth(date: date))
        
        if(date == selectedDate) {
            cell.backgroundColor = UIColor.systemGreen
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    
    
    func setWeekView() {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while(current < nextSunday) {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    @IBAction func prevWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
        
    }
    
    @IBAction func swipeNextWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    
    @IBAction func nextWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    
    @IBAction func swipePrevWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Event().eventsForDate(date: selectedDate).count
        
        //return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        //eventArray.append(event.name + " " + CalendarHelper().timeString(date: event.date))
        //userDefaults.set(eventArray, forKey: "Events")
        cell.eventLabel.text = userDefaults.array(forKey: "Event")?[indexPath.row] as? String
        //cell.eventLabel.text = userDefaults.array(forKey: "Events")?[indexPath.row] as? String
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

