//
//  ViewController.swift
//  Todoey
//
//  Created by Cathal Crowley on 09/07/2019.
//  Copyright © 2019 Cathal Crowley. All rights reserved.
//

import UIKit

class ToDoListViewController:  UITableViewController {
    
   
    

    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        
        
        
// MARK - Tableview Datasource Methods
   
        
     
        
        
  
        
        
        

    
    
    
    
    
}

    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    //MARK- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }
        else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
//        print(itemArray[indexPath.row])
        
        //adds checkmark when cell is selected
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    //MARK- Add new items.
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
        self.itemArray.append(textField.text!)

            self.tableView.reloadData()
            
          
            
        }
    
    
    
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "What Needs To Be Done?"
          textField = alertTextField
        }
    
    alert.addAction(action)
      present(alert, animated: true, completion: nil)
    

}
    
    
}
