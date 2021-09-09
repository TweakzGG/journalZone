//
//  TableViewController.swift
//  Journal
//
//  Created by Jackson Barnes on 9/9/21.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryManager.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let entry = EntryManager.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = "\(entry.timestamp)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = EntryManager.shared.entries[indexPath.row]
            EntryManager.shared.delete(entry: entry)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Segue Identifier
        guard segue.identifier == "editExistingEntry",
        //indexPath
       let indexPath = tableView.indexPathForSelectedRow,
        //Destination
       let destination = segue.destination as? ViewController else { return }
        //Object Ready
        let entry = EntryManager.shared.entries[indexPath.row]
        //Object Sent
            destination.entry = entry
    }
}
