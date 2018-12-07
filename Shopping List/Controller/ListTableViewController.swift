//
//  ListTableViewController.swift
//  Shopping List
//
//  Created by Greg Hughes on 12/7/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit
import CoreData
class ListTableViewController: UITableViewController {
    
    @IBOutlet weak var addItemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  ListController.shared.lists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ListTableViewCell
        let list = ListController.shared.lists[indexPath.row]
        
        cell.delegate? = self
        
        cell.list = list
        // Configure the cell
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            let list = ListController.shared.lists[indexPath.row]
            ListController.shared.delete(list: list)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    @IBAction func addItemButtonTapped(_ sender: Any) {
        presentCreateItemAlert()
        
    }
}



extension ListTableViewController: ListTableViewCellDelegate {
    
    
    func cellButtonTapped(_ cell: ListTableViewCell) {
        //
        if let indexPath = tableView.indexPath(for: cell){
            
            let list = ListController.shared.lists[indexPath.row]
            
            ListController.shared.toggleIsComplete(list: list)
            
            cell.isCompleteButtonTapped(list)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}



extension ListTableViewController {
    
    func presentCreateItemAlert() {
        //Create the alert controller
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping List", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter your item"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            
            guard let itemTextField = alertController.textFields?.first else {return}
            
            ListController.shared.create(item: itemTextField.text ?? "", isComplete: false)
            self.tableView.reloadData()
        }
        alertController.addAction(addAction)
        
        present(alertController, animated: true)
        
    }
}
