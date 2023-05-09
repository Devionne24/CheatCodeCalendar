//
//  EventEditViewController.swift
//  CheatCodeCalendar
//
//  Created by Guest User on 5/5/23.
//

import UIKit

class EventEditViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = selectedDate
    }
    
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTf.text
        newEvent.date = datePicker.date
        
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
}
