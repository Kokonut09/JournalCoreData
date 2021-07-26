//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Andrew Saeyang on 7/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let EntryToSend = EntryController.shared.entries[indexPath.row]

        cell.textLabel?.text = EntryToSend.title

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            
            EntryController.shared.deleteEntry(entry: entryToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "toDetailVC"{
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            
            let entryToSend = EntryController.shared.entries[indexPath.row]
            
            destination.entry = entryToSend
            
        }
    }
}
