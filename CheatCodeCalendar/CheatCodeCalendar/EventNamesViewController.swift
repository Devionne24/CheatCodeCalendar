//
//  EventNamesViewController.swift
//  CheatCodeCalendar
//
//  Created by Guest User on 5/9/23.
//

import UIKit

class EventNamesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var EventNamesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EventNamesTable.delegate = self
        EventNamesTable.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EventNamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.array(forKey: "EventNameUserDefault")?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = UserDefaults.standard.array(forKey: "EventNameUserDefault")?[indexPath.row] as? String
        return cell
    }
    
    
}
